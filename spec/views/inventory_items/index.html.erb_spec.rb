require 'rails_helper'

RSpec.describe "inventory_items/index", type: :view do
  before(:each) do
    assign(:inventory_items, [
      InventoryItem.create!(
        :inventory_location => nil,
        :name => "Name",
        :price => 2,
        :unit_of_measurement => "Unit Of Measurement"
      ),
      InventoryItem.create!(
        :inventory_location => nil,
        :name => "Name",
        :price => 2,
        :unit_of_measurement => "Unit Of Measurement"
      )
    ])
  end

  it "renders a list of inventory_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Unit Of Measurement".to_s, :count => 2
  end
end
