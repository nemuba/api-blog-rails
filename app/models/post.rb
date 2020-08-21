class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many :posts_categories, dependent: :destroy 
  has_many :categories, through: :posts_categories

  validates :title, :body, presence:true
end
