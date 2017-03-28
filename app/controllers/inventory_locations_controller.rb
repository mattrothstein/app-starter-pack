class InventoryLocationsController < ApplicationController
  before_action :set_inventory_location, only: [:show, :edit, :update, :destroy]

  # GET /inventory_locations
  # GET /inventory_locations.json
  def index
    @inventory_locations = InventoryLocation.all
  end

  # GET /inventory_locations/1
  # GET /inventory_locations/1.json
  def show
  end

  # GET /inventory_locations/new
  def new
    @inventory_location = InventoryLocation.new
  end

  # GET /inventory_locations/1/edit
  def edit
  end

  # POST /inventory_locations
  # POST /inventory_locations.json
  def create
    @inventory_location = InventoryLocation.new(inventory_location_params)

    respond_to do |format|
      if @inventory_location.save
        format.html { redirect_to @inventory_location, notice: 'Inventory location was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_location }
      else
        format.html { render :new }
        format.json { render json: @inventory_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_locations/1
  # PATCH/PUT /inventory_locations/1.json
  def update
    respond_to do |format|
      if @inventory_location.update(inventory_location_params)
        format.html { redirect_to @inventory_location, notice: 'Inventory location was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_location }
      else
        format.html { render :edit }
        format.json { render json: @inventory_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_locations/1
  # DELETE /inventory_locations/1.json
  def destroy
    @inventory_location.destroy
    respond_to do |format|
      format.html { redirect_to inventory_locations_url, notice: 'Inventory location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_location
      @inventory_location = InventoryLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_location_params
      params.require(:inventory_location).permit(:name)
    end
end
