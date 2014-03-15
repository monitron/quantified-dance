class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    # XXX Boo hiss hardcoded time zone
    @recent_days = @profile.plays.
      select("date(played_at at time zone 'UTC' at time zone 'EST5EDT') as date," +
             "count(1) as num, sum(survive_seconds) as secs").
             group('date').order('date desc').limit(10)
    # 1+n but .include() kills the count :( at least n <= 10
    @favorite_songs = @profile.plays.joins(:chart).
      select('count(1) as num_plays, chart_id').
      group('chart_id').order('num_plays desc').limit(5)
  end
end
