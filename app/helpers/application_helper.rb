module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end
  def status_label(status)
    case status
    when "approved"
      "<span class='label label-success'>Approved</span>".html_safe
    when "declined"
      "<span class='label label-danger'>Declined</span>".html_safe
    when "pending"
      "<span class='label label-warning'>Pending</span>".html_safe
    end
  end
  def verb(requesting_user, user)
    if requesting_user == user
      "Edit"
    else
      "Approve/Decline"
    end
  end
end
