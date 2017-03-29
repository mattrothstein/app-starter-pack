class CheckoutController < ApplicationController
  before_action :set_inventory_location, only: [:select_item, :new]
  def new
  end

  def select_item
    id =params[:item_id].gsub("4BEAUTY", "")
    begin
      @item = @inventory_location.inventory_items.find(id)
    rescue
      flash[:error] = "Cannot find Item in Inventory Database."
      render :file => "app/views/checkout/error.js.erb" and return
    end
  end

  def create
    begin
      params[:checkout].each do |item_id, amount|
          item = InventoryItem.find(item_id)
          item.checkout(amount.to_i, current_user)
      end
      flash[:success] =  "Successfully Checked Out"
    rescue Exception => ex
      flash[:error] =  "#{ex}"
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_location
      @inventory_location = InventoryLocation.find(params[:id])
    end
end
