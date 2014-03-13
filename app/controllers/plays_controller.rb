class PlaysController < ApplicationController
  def index
    @date = ((params[:date].to_date rescue nil) or Date.today)
    @profile = Profile.find(params[:profile_id])
    @plays = @profile.plays.where(played_at: @date.to_time..@date.to_time.end_of_day)
  end
end
