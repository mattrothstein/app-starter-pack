require 'rails_helper'

RSpec.describe "inventory_item_units/index", type: :view do
  before(:each) do
    assign(:inventory_item_units, [
      InventoryItemUnit.create!(
        :inventory_item => nil,
        :checked_out_by => "Checked Out By"
      ),
      InventoryItemUnit.create!(
        :inventory_item => nil,
        :checked_out_by => "Checked Out By"
      )
    ])
  end

  it "renders a list of inventory_item_units" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Checked Out By".to_s, :count => 2
  end
end
