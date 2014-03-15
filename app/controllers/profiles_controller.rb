class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @recent_days = @profile.plays.
      select("date(played_at, 'localtime') as date, count(1) as num, sum(survive_seconds) as secs").
      group('date').order('date desc').limit(10)
    # 1+n but .include() kills the count :( at least n <= 10
    @favorite_songs = @profile.plays.joins(:chart).
      select('count(1) as num_plays, chart_id').
      group('charts.id').order('num_plays desc').limit(5)
  end
end
