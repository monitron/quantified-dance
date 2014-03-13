module ApplicationHelper
  def relative_date(date)
    diff = (Date.today - date).to_i
    if diff == 0
      "today"
    elsif diff == -1
      "yesterday"
    elsif diff == 1
      "tomorrow"
    elsif diff < 0
      "#{-diff} days ago"
    else
      "#{diff} days from now"
    end
  end
end
