class User < ApplicationRecord
  has_secure_password
  attachment :image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post, dependent: :destroy
  has_many :favorite_tags, dependent: :destroy
  has_many :tags, through: :favorite_tags
  enum is_quit: { 利用中: false, 退会済: true }

  validates :name,
    presence: { message: "ユーザ名を入力してください" },
    length: { minimum: 2, maximum: 20,  message: "ユーザ名は1文字以上、20文字以内で入力してください" },
    uniqueness: { case_sensitive: false, message: "このユーザ名は既に使用されています" }
  validates :email,
    presence: { message: "メールアドレスを入力してください" },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "有効なメールアドレスを入力してください" },
    uniqueness: { case_sensitive: false, message: "このメールアドレスは既に使用されています" }
  validates :password,
    presence:{ message: "パスワードを入力してください" },
    length: { minimum: 8, message: "パスワードは8文字以上で入力してください" },
    allow_nil: true


end
