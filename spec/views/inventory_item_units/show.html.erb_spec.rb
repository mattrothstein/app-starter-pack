require 'rails_helper'

RSpec.describe "inventory_item_units/show", type: :view do
  before(:each) do
    @inventory_item_unit = assign(:inventory_item_unit, InventoryItemUnit.create!(
      :inventory_item => nil,
      :checked_out_by => "Checked Out By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Checked Out By/)
  end
end
