FactoryGirl.define do
  factory :inventory_item_unit do
    inventory_item nil
    checked_out "2017-03-23"
    checked_in "2017-03-23"
    checked_out_by "MyString"
  end
end
