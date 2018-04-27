class ChangeIsPublishInPosts < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :posts, :is_publish, nil
  end
end
