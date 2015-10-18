class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :device_id
      t.string :gcm_registration_id
      t.float :radius
      t.integer :number_of_shares
      t.integer :number_of_ignores

      t.timestamps null: false
    end
  end
end
