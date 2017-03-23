module TimeOffRequestsHelper
  def format_date(date)
    date ? date.strftime("%m/%d/%Y") : ""
  end
end
