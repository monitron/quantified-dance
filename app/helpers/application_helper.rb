module ApplicationHelper
  def relative_date(date)
    diff = (date - Date.today).to_i
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

  def duration_as_min_sec(seconds, long = false)
    mins = (seconds / 60).floor
    secs = (seconds % 60).round
    if long
      "#{mins} minutes, #{secs} seconds"
    else
      "#{mins}m #{secs}s"
    end
  end
end
