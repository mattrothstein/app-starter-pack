class InventoryItemUnitsController < ApplicationController
  before_action :set_inventory_item_unit, only: [:show, :edit, :update, :destroy]

  # GET /inventory_item_units
  # GET /inventory_item_units.json
  def index
    @inventory_item_units = InventoryItemUnit.all
  end

  # GET /inventory_item_units/1
  # GET /inventory_item_units/1.json
  def show
  end

  # GET /inventory_item_units/new
  def new
    @inventory_item_unit = InventoryItemUnit.new
  end

  # GET /inventory_item_units/1/edit
  def edit
  end

  # POST /inventory_item_units
  # POST /inventory_item_units.json
  def create
    @inventory_item_unit = InventoryItemUnit.new(inventory_item_unit_params)

    respond_to do |format|
      if @inventory_item_unit.save
        format.html { redirect_to @inventory_item_unit, notice: 'Inventory item unit was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item_unit }
      else
        format.html { render :new }
        format.json { render json: @inventory_item_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_item_units/1
  # PATCH/PUT /inventory_item_units/1.json
  def update
    respond_to do |format|
      if @inventory_item_unit.update(inventory_item_unit_params)
        format.html { redirect_to @inventory_item_unit, notice: 'Inventory item unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item_unit }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_item_units/1
  # DELETE /inventory_item_units/1.json
  def destroy
    @inventory_item_unit.destroy
    respond_to do |format|
      format.html { redirect_to inventory_item_units_url, notice: 'Inventory item unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item_unit
      @inventory_item_unit = InventoryItemUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_unit_params
      params.require(:inventory_item_unit).permit(:inventory_item_id, :checked_out, :checked_in, :checked_out_by)
    end
end
