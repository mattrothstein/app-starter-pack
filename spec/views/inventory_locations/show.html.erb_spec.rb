require 'rails_helper'

RSpec.describe "inventory_locations/show", type: :view do
  before(:each) do
    @inventory_location = assign(:inventory_location, InventoryLocation.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
