class AddPriorityToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :priority, :integer
  end
end
