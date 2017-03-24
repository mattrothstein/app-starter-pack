require 'rails_helper'

RSpec.describe "inventory_items/edit", type: :view do
  before(:each) do
    @inventory_item = assign(:inventory_item, InventoryItem.create!(
      :inventory_location => nil,
      :name => "MyString",
      :price => 1,
      :unit_of_measurement => "MyString"
    ))
  end

  it "renders the edit inventory_item form" do
    render

    assert_select "form[action=?][method=?]", inventory_item_path(@inventory_item), "post" do

      assert_select "input#inventory_item_inventory_location_id[name=?]", "inventory_item[inventory_location_id]"

      assert_select "input#inventory_item_name[name=?]", "inventory_item[name]"

      assert_select "input#inventory_item_price[name=?]", "inventory_item[price]"

      assert_select "input#inventory_item_unit_of_measurement[name=?]", "inventory_item[unit_of_measurement]"
    end
  end
end
