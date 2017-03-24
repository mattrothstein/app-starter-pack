require 'rails_helper'

RSpec.describe "inventory_item_units/edit", type: :view do
  before(:each) do
    @inventory_item_unit = assign(:inventory_item_unit, InventoryItemUnit.create!(
      :inventory_item => nil,
      :checked_out_by => "MyString"
    ))
  end

  it "renders the edit inventory_item_unit form" do
    render

    assert_select "form[action=?][method=?]", inventory_item_unit_path(@inventory_item_unit), "post" do

      assert_select "input#inventory_item_unit_inventory_item_id[name=?]", "inventory_item_unit[inventory_item_id]"

      assert_select "input#inventory_item_unit_checked_out_by[name=?]", "inventory_item_unit[checked_out_by]"
    end
  end
end
