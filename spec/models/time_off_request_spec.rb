require 'rails_helper'

RSpec.describe TimeOffRequest, type: :model do
  context "that is just created" do
    it "has status set to pending" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      params = {"start_date(1i)"=>"2017", "start_date(2i)"=>"3", "start_date(3i)"=>"3", "end_date(1i)"=>"2017", "end_date(2i)"=>"3", "end_date(3i)"=>"3"}
      rqst = user.time_off_requests.create!(params)
      expect(rqst.status).to eq('pending')
    end

    it "is invalid without start_date" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = { "end_date(1i)"=>"2017", "end_date(2i)"=>"3", "end_date(3i)"=>"3"}
      rqst = user.time_off_requests.build(params)
      expect(rqst).to be_invalid
    end

    it "is invalid without end_date" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = {"start_date(1i)"=>"2017", "start_date(2i)"=>"3", "start_date(3i)"=>"3"}
      rqst = user.time_off_requests.build(params)
      expect(rqst).to be_invalid
    end

    it "is invalid when start_date is after end_date" do
      userType = UserType.create!(name: 'general')
      user = User.create!(email: "test@gmail.com", password: "123456789")
      #no notes
      params = {"start_date(1i)"=>"2017", "start_date(2i)"=>"4", "start_date(3i)"=>"3", "end_date(1i)"=>"2017", "end_date(2i)"=>"3", "end_date(3i)"=>"3"}
      rqst = user.time_off_requests.build(params)
      expect(rqst).to be_invalid
    end

  end
end
