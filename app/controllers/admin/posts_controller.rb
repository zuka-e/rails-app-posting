class Admin::PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page])
    if params[:tag].present?
      @posts = Post.joins(:tags).where("tags.name = ? AND is_open = ?", params[:tag], true).page(params[:page])
    elsif params[:user].present?
      @posts = Post.joins(:user).where("users.name = ? AND is_open = ?", params[:user], true).page(params[:page])
    elsif params[:commented_by].present?
      commented_posts_ids = Comment.joins(:user).group(:post_id).where("users.name = ?", params[:commented_by]).pluck(:post_id)
      @posts = Post.where("id = ? AND is_open = ?", commented_posts_ids, true).page(params[:page])
    end

  end

  def new
    @post = Post.new
    @tag = Tag.new
    @tags = Tag.page(params[:page])
  end
  def create
    @post = Post.new(post_params)
    @post.user = User.first
    params[:post][:is_open] == '1' ? @post.is_open = true : @post.is_open = false
    if @post.save
      @post.post_tags.create(tag: Tag.create(tag_params))
      flash[:success] = '投稿が作成されました'
      redirect_to [:admin, @post.user, @post]
    else
      @tags = Tag.page(params[:page])
      render 'new'
    end
  end
  def show
    ranked_tag_ids = PostTag.group(:tag_id).order( Arel.sql("count(tag_id) DESC")).limit(10).pluck(:tag_id)
    @popular_tags = Tag.find(ranked_tag_ids)
    @post = Post.find_by(user_id: params[:user_id], id: params[:id])
    @comment = Comment.new
  end

    private

    def post_params
      params.require(:post).permit(:title, :content, :writing_time)
    end
    def tag_params
			params.require(:tag).permit(:name)
		end

end
