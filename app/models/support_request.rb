class SupportRequest < ApplicationRecord
  belongs_to :user

  validates_presence_of :issue, :priority

  before_create :set_status_to_open

  def set_status_to_open
    self.status = "open"
  end

end
