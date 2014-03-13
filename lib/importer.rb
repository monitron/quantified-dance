
# Imports StepMania data
# Sync is additive; nothing is ever deleted
# Changes to profiles are noticed. Changes to songs and plays are not.

class Importer
  def initialize
    @data = StepmaniaData.new
  end

  def run
    sync_songs
    sync_profiles
    sync_plays    # Depends on profiles and songs
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

  def sync_songs
    # Match to existing records based on dir
    @data.songs.each do |song_data|
      unless Song.find_by_dir(song_data[:dir])
        params = song_data.except(:charts)
        song = Song.create params
        song_data[:charts].each do |chart_data|
          song.charts.create chart_data
        end
      end
    end
  end

  def sync_plays
    # Match to existing records based on guid
    @data.plays.each do |play_data|
      unless Play.find_by_guid(play_data[:guid]) # Stages are never updated
        params = play_data.except(:player_guid, :song_dir, :difficulty, :steps_type)
        # Look up associated profile by guid
        if play_data[:player_guid].present?
          params[:profile_id] =
            Profile.find_by_guid(play_data[:player_guid]).try(:id)
        end
        # Look up chart by song dir, difficulty and type
        params[:chart_id] = Song.find_by_dir(play_data[:song_dir]).charts.
          find_by_difficulty_and_steps_type(play_data[:difficulty], play_data[:steps_type]).id
        Play.create params
      end
    end
  end
end
