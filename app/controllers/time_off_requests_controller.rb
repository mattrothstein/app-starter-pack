class TimeOffRequestsController < ApplicationController
  before_action :set_time_off_request, only: [:show, :edit, :update, :destroy]
  before_action :create_date_from_string, only: [:create, :update]
  # GET /time_off_requests
  # GET /time_off_requests.json
  def index
    if current_user.user_type.name == 'executive' || current_user.user_type.name == 'management'
      @time_off_requests = TimeOffRequest.all.order(created_at: :desc)
    else
      @time_off_requests = current_user.time_off_requests.order(created_at: :desc)
    end
  end

  # GET /time_off_requests/1
  # GET /time_off_requests/1.json
  def show
  end

  # GET /time_off_requests/new
  def new
    @time_off_request = current_user.time_off_requests.new
  end

  # GET /time_off_requests/1/edit
  def edit
    @form = if @time_off_request.user == current_user
      "form"
    else
      current_user.user_type.name == 'executive' || current_user.user_type.name == 'management' ? "approval" : "form"
    end
  end

  # POST /time_off_requests
  # POST /time_off_requests.json
  def create
    @time_off_request = current_user.time_off_requests.new(time_off_request_params)

    respond_to do |format|
      if @time_off_request.save
        format.html { redirect_to @time_off_request, notice: 'Time off request was successfully created.' }
        format.json { render :show, status: :created, location: @time_off_request }
        format.js { flash.now[:success] = 'Time Off Request was succesfully created' }
      else
        format.html { render :new }
        format.json { render json: @time_off_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/time_off_requests/error.js.erb"}
      end
    end
  end

  # PATCH/PUT /time_off_requests/1
  # PATCH/PUT /time_off_requests/1.json
  def update
    respond_to do |format|
      if @time_off_request.update(time_off_request_params)
        if !request.referrer.include? "time_off_requests"
          redirect_to root_path and return
        end
        format.json { render :show, status: :ok, location: @time_off_request }
        format.js { flash.now[:success] = 'Time Off Request was succesfully updated' }
      else
        format.html { render :edit }
        format.json { render json: @time_off_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/time_off_requests/error.js.erb" }
      end
    end
  end

  # DELETE /time_off_requests/1
  # DELETE /time_off_requests/1.json
  def destroy
    @time_off_request.destroy
    respond_to do |format|
      format.html { redirect_to time_off_requests_url, notice: 'Time off request was successfully destroyed.' }
      format.json { head :no_content }
      format.js { flash.now[:error] = 'Succesfully deleted Time Off Request' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_off_request
      @time_off_request = TimeOffRequest.find(params[:id])
    end

    def create_date_from_string
      if params[:time_off_request][:start_date].present? && params[:time_off_request][:end_date].present?
        params[:time_off_request][:start_date] = DateTime.strptime(params[:time_off_request][:start_date], '%m/%d/%Y %l:%M %p ')
        params[:time_off_request][:end_date] = DateTime.strptime(params[:time_off_request][:end_date], '%m/%d/%Y %l:%M %p')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_off_request_params
      params.require(:time_off_request).permit(:user_id, :start_date, :end_date, :status, :note, :leave_time, :return_time)
    end
end
