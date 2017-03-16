module SupportRequestsHelper
  def support_status_label(status)
    case status
    when "complete"
      "<span class='label label-success'>Completed</span>".html_safe
    when "open"
      "<span class='label label-info'>Open</span>".html_safe
    when "pending"
      "<span class='label label-warning'>Pending</span>".html_safe
    end
  end
  def priority_label(priority)
    case priority
    when "urgent"
      "<span class='label label-danger'>Urgent</span>".html_safe
    when "high"
      "<span class='label label-warning'>High</span>".html_safe
    when "normal"
      "<span class='label label-primary'>Normal</span>".html_safe
    when "low"
      "<span class='label label-info'>Low</span>".html_safe
    end
  end
  def support_verb(requesting_user, user)
    if requesting_user == user
      "Edit"
    else
      "Claim"
    end
  end
end
