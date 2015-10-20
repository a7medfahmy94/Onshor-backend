class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.integer :number_of_ignores
      t.integer :number_of_shares

      t.timestamps null: false
    end
  end
end
