require 'rails_helper'

RSpec.describe "InventoryLocations", type: :request do
  describe "GET /inventory_locations" do
    it "works! (now write some real specs)" do
      get inventory_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
