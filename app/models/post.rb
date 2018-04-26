class Post < ApplicationRecord
  belongs_to :administrator
  has_many :tag_posts ,dependent: :destroy
  has_many :tags, through: :tag_posts
  has_many :comments, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :is_publish, presence: true
end
