
# Reads a StepMania 5 data directory

class StepmaniaData
  def initialize(path = STEPMANIA_DATA_PATH)
    @path = File.expand_path(path)
  end

  def profiles
    profile_stats_xml_paths.map do |filename|
      xml = Nokogiri::XML(File.open(filename))
      {
        :name               => xml.at_css('DisplayName').text,
        :guid               => xml.at_css('Guid').text,
        :total_play_seconds => xml.at_css('TotalGameplaySeconds').text.to_i,
        :last_played_on     => xml.at_css('LastPlayedDate').text.to_date
      }
    end
  end

  def plays
    stage_stats_xml_paths.map do |filename|
      xml = Nokogiri::XML(File.open(filename))
      xml.css('HighScoreForASongAndSteps').map do |play_xml|
        {
          :guid            => play_xml.at_css('Guid').text,
          :song_dir        => play_xml.at_css('Song')['Dir'],
          :player_guid     => play_xml.at_css('PlayerGuid').text,
          :difficulty      => play_xml.at_css('Steps')['Difficulty'],
          :grade           => play_xml.at_css('Grade').text,
          :score           => play_xml.at_css('Score').text.to_i,
          :percent_dp      => play_xml.at_css('PercentDP').text.to_f,
          :max_combo       => play_xml.at_css('MaxCombo').text.to_i,
          :survive_seconds => play_xml.at_css('SurviveSeconds').text.to_f,
          :played_at       => play_xml.at_css('DateTime').text.to_time
        }
      end
    end.flatten
  end

  private
  def stage_stats_xml_paths
    Dir.glob(File.join(@path, 'Save', 'Upload', '*.xml'))
  end
  
  def profile_stats_xml_paths
    base_path = File.join(@path, 'Save', 'LocalProfiles')
    dir_regex = /^\d\d\d\d\d\d\d\d$/
    Dir.open(base_path) do |dir|
      dir.select { |entry| dir_regex.match(entry) }.map do |entry|
        File.join(@path, 'Save', 'LocalProfiles', entry, 'Stats.xml')
      end
    end
  end
end
