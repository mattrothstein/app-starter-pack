class SupportRequestsController < ApplicationController
  before_action :set_support_request, only: [:show, :edit, :update, :destroy]

  # GET /support_requests
  # GET /support_requests.json
  def index
    @support_requests = if current_user.user_type.name == 'executive' || current_user.user_type.name == 'management'
      SupportRequest.all.order(created_at: :desc)
    else
      current_user.support_requests.order(created_at: :desc)
    end
  end

  # GET /support_requests/1
  # GET /support_requests/1.json
  def show
  end

  # GET /support_requests/new
  def new
    @support_request = SupportRequest.new
  end

  # GET /support_requests/1/edit
  def edit
    @form = if @support_request.user == current_user
      "form"
    else
      current_user.user_type.name == 'executive' || current_user.user_type.name == 'management' ? "claim" : "form"
    end
  end

  # POST /support_requests
  # POST /support_requests.json
  def create
    @support_request = SupportRequest.new(support_request_params)

    respond_to do |format|
      if @support_request.save
        format.html { redirect_to @support_request, notice: 'Support request was successfully created.' }
        format.json { render :show, status: :created, location: @support_request }
        format.js { flash.now[:success] = 'Support Request was succesfully created' }
      else
        format.html { render :new }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/support_requests/error.js.erb"}
      end
    end
  end

  # PATCH/PUT /support_requests/1
  # PATCH/PUT /support_requests/1.json
  def update
    respond_to do |format|
      if @support_request.update(support_request_params)
        format.html { redirect_to @support_request, notice: 'Support request was successfully updated.' }
        format.json { render :show, status: :ok, location: @support_request }
        format.js { flash.now[:success] = 'Support Request was succesfully updated' }
      else
        format.html { render :edit }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/support_requests/error.js.erb"}
      end
    end
  end

  # DELETE /support_requests/1
  # DELETE /support_requests/1.json
  def destroy
    @support_request.destroy
    respond_to do |format|
      format.html { redirect_to support_requests_url, notice: 'Support request was successfully destroyed.' }
      format.json { head :no_content }
      format.js { flash.now[:success] = 'Support Request was succesfully destoryed' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_request_params
      params.require(:support_request).permit(:status, :issue, :priority, :user_id)
    end
end
