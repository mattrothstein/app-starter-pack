require 'rails_helper'

RSpec.describe PurchaseOrderRequest, type: :model do
  context "that is just created" do
    it "has status set to pending" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      params = {"name"=>"test", "notes"=>"body_test", "price"=> 1000}
      rqst = user.purchase_order_requests.create!(params)
      expect(rqst.status).to eq('pending')
    end

    it "is invalid without without a name" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no name
      params = {"notes"=>"body_test", "price"=> 1000}
      rqst = user.purchase_order_requests.build(params)
      expect(rqst).to be_invalid
    end

    it "is invalid without without notes" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = {"name"=>"test", "price"=> 1000}
      rqst = user.purchase_order_requests.build(params)
      expect(rqst).to be_invalid
    end

    it "is invalid without without price" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = {"name"=>"test","notes"=>"body_test"}
      rqst = user.purchase_order_requests.build(params)
      expect(rqst).to be_invalid
    end

  end
end
