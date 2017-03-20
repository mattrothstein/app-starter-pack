class ProjectApprovalRequest < ApplicationRecord
  belongs_to :user, dependent: :destroy 
  validates_presence_of :name, :notes

  before_create :set_status_to_pending

  def set_status_to_pending
    self.status = "pending"
  end
end
