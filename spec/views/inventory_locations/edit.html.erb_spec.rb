require 'rails_helper'

RSpec.describe "inventory_locations/edit", type: :view do
  before(:each) do
    @inventory_location = assign(:inventory_location, InventoryLocation.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit inventory_location form" do
    render

    assert_select "form[action=?][method=?]", inventory_location_path(@inventory_location), "post" do

      assert_select "input#inventory_location_name[name=?]", "inventory_location[name]"
    end
  end
end
