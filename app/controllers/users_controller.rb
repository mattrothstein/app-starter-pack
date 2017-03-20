class UsersController < ApplicationController
  before_action :boot_general
  before_action :set_user, only: [:edit, :update, :destroy]
  # GET /user_types
  # GET /user_types.json
  def index
    @users = User.all
  end
  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js { flash.now[:success] = 'User was succesfully updated' }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/users/error.js.erb"}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      format.js { flash.now[:error] = 'User was successfully destroyed.'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :user_type_id)
  end

  def set_user()
    @user = User.find(params[:id])
  end

  def boot_general()
    if current_user.user_type.name == "general"
      redirect_to root, error: "You are not authorized to view this page."
    end
  end
end
