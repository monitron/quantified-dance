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

  def grade_name(grade)
    {
      "Tier01" => "AAAA",
      "Tier02" => "AAA",
      "Tier03" => "AA",
      "Tier04" => "A",
      "Tier05" => "B",
      "Tier06" => "C",
      "Tier07" => "D",
      "Failed" => "E",
      "NoData" => "No Data"
    }[grade]
  end
end
