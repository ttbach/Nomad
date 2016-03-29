class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :locations, [:user_id, :created_at]
  end
end
