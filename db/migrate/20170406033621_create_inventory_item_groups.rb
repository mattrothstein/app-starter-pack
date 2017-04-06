class CreateInventoryItemGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_item_groups do |t|
      t.references :inventory_location, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
