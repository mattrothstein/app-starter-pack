require 'rails_helper'

RSpec.describe SupportRequest, type: :model do
  context "that is just created" do
    it "has status set to open" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      params = {"issue"=>"test", "priority"=> "low"}
      rqst = user.support_requests.create!(params)
      expect(rqst.status).to eq('open')
    end

    it "is invalid without without issue" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = { "priority"=> "low"}
      rqst = user.support_requests.build(params)
      expect(rqst).to be_invalid
    end

    it "is invalid without without priority" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = {"issue"=>"test"}
      rqst = user.support_requests.build(params)
      expect(rqst).to be_invalid
    end

  end
end
