class ProjectApprovalRequestsController < ApplicationController
  before_action :set_project_approval_request, only: [:show, :edit, :update, :destroy]

  # GET /project_approval_requests
  # GET /project_approval_requests.json
  def index
    if current_user.user_type.name == 'executive' || current_user.user_type.name == 'management'
      @project_approval_requests = ProjectApprovalRequest.all.order(created_at: :desc)
    else
      @project_approval_requests = current_user.project_approval_requests.order(created_at: :desc)
    end
  end

  # GET /project_approval_requests/1
  # GET /project_approval_requests/1.json
  def show
  end

  # GET /project_approval_requests/new
  def new
    @project_approval_request = ProjectApprovalRequest.new
  end

  # GET /project_approval_requests/1/edit
  def edit
    @form = if @project_approval_request.user == current_user
      "form"
    else
      current_user.user_type.name == 'executive' || current_user.user_type.name == 'management' ? "approval" : "form"
    end
  end

  # POST /project_approval_requests
  # POST /project_approval_requests.json
  def create
    @project_approval_request = current_user.project_approval_requests.new(project_approval_request_params)

    respond_to do |format|
      if @project_approval_request.save
        format.html { redirect_to @project_approval_request, notice: 'Project approval request was successfully created.' }
        format.json { render :show, status: :created, location: @project_approval_request }
        format.js { flash.now[:success] = 'Project Approval Request was succesfully created' }
      else
        format.html { render :new }
        format.json { render json: @project_approval_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/project_approval_requests/error.js.erb"}
      end
    end
  end

  # PATCH/PUT /project_approval_requests/1
  # PATCH/PUT /project_approval_requests/1.json
  def update
    respond_to do |format|
      if @project_approval_request.update(project_approval_request_params)
        format.html { redirect_to @project_approval_request, notice: 'Project approval request was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_approval_request }
        format.js { flash.now[:success] = 'Project Approval Request was succesfully created' }
      else
        format.html { render :edit }
        format.json { render json: @project_approval_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/project_approval_requests/error.js.erb"}
      end
    end
  end

  # DELETE /project_approval_requests/1
  # DELETE /project_approval_requests/1.json
  def destroy
    @project_approval_request.destroy
    respond_to do |format|
      format.html { redirect_to project_approval_requests_url, notice: 'Project approval request was successfully destroyed.' }
      format.json { head :no_content }
      format.js { flash.now[:error] = 'Succesfully deleted Request' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_approval_request
      @project_approval_request = ProjectApprovalRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_approval_request_params
      params.require(:project_approval_request).permit(:user_id, :name, :notes, :status)
    end
end
