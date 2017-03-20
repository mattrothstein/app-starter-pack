class Users::InvitationsController < Devise::InvitationsController
  before_filter :update_sanitized_params, only: :update
  layout 'public', only: [:edit]
  def new
    super
  end
  def edit
    super
  end
  def create
    super
  end
  def update
    super
  end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :password, :password_confirmation, :invitation_token, :user_type_id])
  end

  def after_invite_path_for(resource)
    users_path
  end

end
