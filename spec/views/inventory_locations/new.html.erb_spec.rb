require 'rails_helper'

RSpec.describe "inventory_locations/new", type: :view do
  before(:each) do
    assign(:inventory_location, InventoryLocation.new(
      :name => "MyString"
    ))
  end

  it "renders new inventory_location form" do
    render

    assert_select "form[action=?][method=?]", inventory_locations_path, "post" do

      assert_select "input#inventory_location_name[name=?]", "inventory_location[name]"
    end
  end
end
