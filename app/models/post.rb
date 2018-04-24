class Post < ApplicationRecord
  belongs_to :administrator
  has_many :tag_posts ,dependent: :destroy
  has_many :tags, through: :tag_posts

  validates :title, presence: true
  validates :content, presence: true
  validates :is_publish, presence: true
end
