
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
  
  private
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
