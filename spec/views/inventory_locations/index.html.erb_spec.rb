require 'rails_helper'

RSpec.describe "inventory_locations/index", type: :view do
  before(:each) do
    assign(:inventory_locations, [
      InventoryLocation.create!(
        :name => "Name"
      ),
      InventoryLocation.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of inventory_locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
