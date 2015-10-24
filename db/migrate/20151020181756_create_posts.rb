class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.integer :number_of_ignores , :default => 0
      t.integer :number_of_shares , :default => 0

      t.timestamps null: false
    end
  end
end
