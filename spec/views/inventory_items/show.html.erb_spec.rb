require 'rails_helper'

RSpec.describe "inventory_items/show", type: :view do
  before(:each) do
    @inventory_item = assign(:inventory_item, InventoryItem.create!(
      :inventory_location => nil,
      :name => "Name",
      :price => 2,
      :unit_of_measurement => "Unit Of Measurement"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Unit Of Measurement/)
  end
end
