class AddUnitsToGroupedItem < ActiveRecord::Migration[5.0]
  def change
    add_column :grouped_items, :units, :integer
  end
end
