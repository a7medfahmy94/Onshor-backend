class AddIndexToPostsUsers < ActiveRecord::Migration
  def change
    add_index :posts_users , [:user_id, :post_id] , unique: true
    add_index :posts_users , [:post_id, :user_id]
  end
end
