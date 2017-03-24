require "rails_helper"

RSpec.describe InventoryItemUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inventory_item_units").to route_to("inventory_item_units#index")
    end

    it "routes to #new" do
      expect(:get => "/inventory_item_units/new").to route_to("inventory_item_units#new")
    end

    it "routes to #show" do
      expect(:get => "/inventory_item_units/1").to route_to("inventory_item_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inventory_item_units/1/edit").to route_to("inventory_item_units#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inventory_item_units").to route_to("inventory_item_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inventory_item_units/1").to route_to("inventory_item_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inventory_item_units/1").to route_to("inventory_item_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inventory_item_units/1").to route_to("inventory_item_units#destroy", :id => "1")
    end

  end
end
