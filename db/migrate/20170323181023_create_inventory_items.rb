class CreateInventoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_items do |t|
      t.references :inventory_location, foreign_key: true
      t.string :name
      t.integer :price
      t.string :unit_of_measurement

      t.timestamps
    end
  end
end
