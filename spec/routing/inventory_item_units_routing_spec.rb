require "rails_helper"

RSpec.describe InventoryItemUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inventory_locations/1/inventory_items/1/inventory_item_units").to route_to("inventory_item_units#index",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/inventory_locations/1/inventory_items/1/inventory_item_units/new").to route_to("inventory_item_units#new",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/inventory_locations/1/inventory_items/1/inventory_item_units/1").to route_to("inventory_item_units#show", :id => "1",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/inventory_locations/1/inventory_items/1/inventory_item_units/1/edit").to route_to("inventory_item_units#edit", :id => "1",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/inventory_locations/1/inventory_items/1/inventory_item_units").to route_to("inventory_item_units#create",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inventory_locations/1/inventory_items/1/inventory_item_units/1").to route_to("inventory_item_units#update", :id => "1",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inventory_locations/1/inventory_items/1/inventory_item_units/1").to route_to("inventory_item_units#update", :id => "1",:inventory_item_id => "1", inventory_location_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inventory_locations/1/inventory_items/1/inventory_item_units/1").to route_to("inventory_item_units#destroy", :id => "1",:inventory_item_id => "1", inventory_location_id: "1")
    end

  end
end
