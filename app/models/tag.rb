class Tag < ApplicationRecord
	has_many :posts, through: :tag_posts
	validates :name, presence: true

	def in_use?
		TagPost.exists?(tag_id: self.id)
	end
end
