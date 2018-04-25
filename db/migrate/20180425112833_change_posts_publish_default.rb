class ChangePostsPublishDefault < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :posts, :is_publish, false
  end
end
