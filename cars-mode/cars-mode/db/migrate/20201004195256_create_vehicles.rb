class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :make
      t.integer :driver_id

      t.timestamps null: false
    end
  end
end
