
# Imports StepMania data
# Sync is additive; nothing is ever deleted

class Importer
  def initialize
    @data = StepmaniaData.new
  end

  def run
    sync_profiles
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
end
