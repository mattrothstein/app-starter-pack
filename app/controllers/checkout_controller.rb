class CheckoutController < ApplicationController
  def new
  end

  def add_item
    id =params[:item_id].gsub("4BEAUTY", "")
    @item = InventoryItem.find(id)
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

  def show
  end
end
