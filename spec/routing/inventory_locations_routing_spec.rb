require "rails_helper"

RSpec.describe InventoryLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/inventory_locations").to route_to("inventory_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/inventory_locations/new").to route_to("inventory_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/inventory_locations/1").to route_to("inventory_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/inventory_locations/1/edit").to route_to("inventory_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/inventory_locations").to route_to("inventory_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/inventory_locations/1").to route_to("inventory_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/inventory_locations/1").to route_to("inventory_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/inventory_locations/1").to route_to("inventory_locations#destroy", :id => "1")
    end

  end
end
