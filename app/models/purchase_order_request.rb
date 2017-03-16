class PurchaseOrderRequest < ApplicationRecord
  belongs_to :user

  before_create :set_status_to_pending

  def set_status_to_pending
    self.status = "pending"
  end

  def price_in_dollars
    (self.price).to_f / 100
  end
end
