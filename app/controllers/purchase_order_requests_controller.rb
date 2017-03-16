class PurchaseOrderRequestsController < ApplicationController
  before_action :set_purchase_order_request, only: [:show, :edit, :update, :destroy]
  before_action :convert_to_pennies, only: [:create, :update]
  # GET /purchase_order_requests
  # GET /purchase_order_requests.json
  def index
    if current_user.user_type.name == 'executive' || current_user.user_type.name == 'management'
      @purchase_order_requests = PurchaseOrderRequest.all.order(created_at: :desc)
    else
      @purchase_order_requests = current_user.purchase_order_requests.order(created_at: :desc)
    end
  end

  # GET /purchase_order_requests/1
  # GET /purchase_order_requests/1.json
  def show
  end

  # GET /purchase_order_requests/new
  def new
    @purchase_order_request = PurchaseOrderRequest.new
  end

  # GET /purchase_order_requests/1/edit
  def edit
    @form = if @purchase_order_request.user == current_user
      "form"
    else
      current_user.user_type.name == 'executive' || current_user.user_type.name == 'management' ? "approval" : "form"
    end
  end

  # POST /purchase_order_requests
  # POST /purchase_order_requests.json
  def create
    @purchase_order_request = PurchaseOrderRequest.new(purchase_order_request_params)

    respond_to do |format|
      if @purchase_order_request.save
        format.html { redirect_to @purchase_order_request, notice: 'Purchase order request was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order_request }
        format.js { flash.now[:success] = 'Purchase Order Request was succesfully created' }
      else
        format.html { render :new }
        format.json { render json: @purchase_order_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/purchase_order_requests/error.js.erb"}
      end
    end
  end

  # PATCH/PUT /purchase_order_requests/1
  # PATCH/PUT /purchase_order_requests/1.json
  def update
    respond_to do |format|
      if @purchase_order_request.update(purchase_order_request_params)
        format.html { redirect_to @purchase_order_request, notice: 'Purchase order request was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_request }
        format.js { flash.now[:success] = 'Purchase Order Request was succesfully updated' }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_request.errors, status: :unprocessable_entity }
        format.js { render :file => "app/views/purchase_order_requests/error.js.erb"}
      end
    end
  end

  # DELETE /purchase_order_requests/1
  # DELETE /purchase_order_requests/1.json
  def destroy
    @purchase_order_request.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_requests_url, notice: 'Purchase order request was successfully destroyed.' }
      format.json { head :no_content }
      format.js { flash.now[:error] = 'Purchase Order Request was succesfully destroyed' }
    end
  end

  private

    def convert_to_pennies
      params[:purchase_order_request][:price] = (params[:purchase_order_request][:price].to_f * 100).to_s if params[:purchase_order_request][:price]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_request
      @purchase_order_request = PurchaseOrderRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_request_params
      params.require(:purchase_order_request).permit(:user_id, :name, :notes, :price, :status, :price_in_pennies)
    end
end
