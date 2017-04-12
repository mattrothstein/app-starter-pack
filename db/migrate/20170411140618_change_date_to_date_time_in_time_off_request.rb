class ChangeDateToDateTimeInTimeOffRequest < ActiveRecord::Migration[5.0]
  def change
    change_column :time_off_requests, :start_date, :datetime
    change_column :time_off_requests, :end_date, :datetime
  end
end
