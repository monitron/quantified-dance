class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def show
    @song = Song.find(params[:id])
    @charts = @song.charts
    if params[:chart_id].present?
      @chart = @charts.find(params[:chart_id])
    else
      @chart = @charts.first
    end

    if params[:profile_id].present?
      @profile = Profile.find(params[:profile_id])
    end
    
    @plays = @chart.plays
    if @profile.present?
      @plays = @plays.find_all_by_profile_id(@profile)
    end
  end
end
