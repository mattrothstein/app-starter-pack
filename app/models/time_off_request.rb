class TimeOffRequest < ApplicationRecord
  belongs_to :user

  validates_presence_of :start_date, :end_date
  validate :end_date_after_start_date?

  before_create :set_status_to_pending

  def set_status_to_pending
    self.status = "pending"
  end

  def end_date_after_start_date?
    return if end_date.nil? || start_date.nil?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

end
