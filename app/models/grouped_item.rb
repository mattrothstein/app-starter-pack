class GroupedItem < ApplicationRecord
  belongs_to :inventory_item_group
  belongs_to :inventory_item
end
