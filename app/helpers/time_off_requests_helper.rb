module TimeOffRequestsHelper
  def format_date(date)
    date ? date.strftime("%m/%d/%Y") : ""
  end

  def display_date_time(date)
    if date.nil?
      DateTime.now.strftime('%m/%d/%Y %l:%M %p')
    else
      date.strftime('%m/%d/%Y %l:%M %p')
    end
  end
end
