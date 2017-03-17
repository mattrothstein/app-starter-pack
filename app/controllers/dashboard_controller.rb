class DashboardController < ApplicationController
  def index
    @time_off_requests = TimeOffRequest.all
  end
end
