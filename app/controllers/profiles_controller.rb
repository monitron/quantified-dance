class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @recent_days = @profile.plays.
      select("date(played_at, 'localtime') as date, count(1) as num, sum(survive_seconds) as secs").
      group('date').order('date desc').limit(10)
  end
end
