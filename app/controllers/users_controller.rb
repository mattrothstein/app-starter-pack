class UsersController < ApplicationController
  before_action :boot_general
  # GET /user_types
  # GET /user_types.json
  def index
    @users = User.all
  end

  private

  def boot_general()
    if current_user.user_type.name == "general"
      redirect_to root, error: "You are not authorized to view this page."
    end
  end
end
