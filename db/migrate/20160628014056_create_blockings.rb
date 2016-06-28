class CreateBlockings < ActiveRecord::Migration
  def change
    create_table :blockings do |t|
      t.integer :user_one
      t.integer :user_two
    end
  end
end
