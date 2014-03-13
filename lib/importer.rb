
# Imports StepMania data
# Sync is additive; nothing is ever deleted

class Importer
  def initialize
    @data = StepmaniaData.new
  end

  def run
    sync_profiles
    sync_plays
  end

  def sync_profiles
    # Match to existing records based on guid
    @data.profiles.each do |profile_data|
      existing_profile = Profile.find_by_guid(profile_data[:guid])
      if existing_profile
        existing_profile.update profile_data
      else
        Profile.create profile_data
      end
    end
  end

  def sync_plays
    # Match to existing records based on guid
    @data.plays.each do |play_data|
      existing_play = Play.find_by_guid(play_data[:guid])
      unless existing_play # Stages are never updated, afaik
        params = play_data.except(:player_guid, :song_dir)
        # Look up associated profile by guid
        if play_data[:player_guid].present?
          params[:profile_id] =
            Profile.find_by_guid(play_data[:player_guid]).try(:id)
        end
        Play.create params
      end
    end
  end
end
