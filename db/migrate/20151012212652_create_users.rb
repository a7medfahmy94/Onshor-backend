class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :device_id
      t.string :gcm_registration_id
      t.float :radius
      t.integer :number_of_shares , :default => 0
      t.integer :number_of_ignores , :default => 0

      t.timestamps null: false
    end
  end
end
