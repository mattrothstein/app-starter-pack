require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/png_outputter'
class InventoryItemsController < ApplicationController
  before_action :set_inventory_location
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    respond_to do |format|
      format.html do
        @inventory_items = @inventory_location.inventory_items.paginate(:page => params[:page])
      end
      format.pdf do
        @inventory_items = @inventory_location.inventory_items
        render pdf: "index"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
    if @inventory_item.barcode.url == "/barcodes/original/missing.png"
      @inventory_item.create_barcode
      @inventory_item.save
    end
  end

  def search
    id = params[:id].gsub('4BEAUTY','')
    @inventory_item = InventoryItem.find(id)
    redirect_to inventory_location_inventory_item_path(@inventory_location, @inventory_item)
  end

  # GET /inventory_items/new
  def new
    @inventory_item = @inventory_location.inventory_items.new
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  # POST /inventory_items.json
  def create
    @inventory_item = @inventory_location.inventory_items.new(inventory_item_params)

    respond_to do |format|
      if @inventory_item.save
        barcode_value = ("4BEAUTY#{@inventory_item.id.to_s}").to_s.to_blob
        full_path = "public/barcodes/barcode_#{@inventory_item.id.to_s.to_blob}.png"
        barcode = Barby::Code39.new(barcode_value)
        File.open(full_path, 'wb') { |f| f.write barcode.to_png() }
        @inventory_item.barcode = File.open(full_path)
        if @inventory_item.save
          FileUtils.rm(full_path)
        end
        format.html { redirect_to inventory_location_inventory_items_path(@inventory_item.inventory_location), notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  # PATCH/PUT /inventory_items/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to inventory_location_inventory_items_path(@inventory_item.inventory_location), notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /inventory_items/1
  # DELETE /inventory_items/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_location_inventory_items_path(@inventory_item.inventory_location), notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_location
      @inventory_location = InventoryLocation.find(params[:inventory_location_id])
    end

    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_params
      params.require(:inventory_item).permit(:inventory_location_id, :name, :price, :unit_of_measurement)
    end
end
