module DashboardHelper
  def alert_color(status)
    case status
    when "approved"
      "success"
    when "declined"
      "danger"
    when "pending"
      "warning"
    end
  end
  def glyphicon(status)
    case status
    when "approved"
      "glyphicon-ok-sign"
    when "declined"
      "glyphicon-remove-sign"
    when "pending"
      "glyphicon-question-sign"
    end
  end

end
