class CreateCreatePosts < ActiveRecord::Migration
  def change
    create_table :create_posts do |t|
      t.string :model
      t.integer :year
      t.integer :driver_id

      t.timestamps null: false
    end
  end
end
