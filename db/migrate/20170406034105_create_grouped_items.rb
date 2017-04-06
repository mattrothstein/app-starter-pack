class CreateGroupedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :grouped_items do |t|
      t.references :inventory_item_group, foreign_key: true
      t.references :inventory_item, foreign_key: true

      t.timestamps
    end
  end
end
