class MovieTimingsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @movie_timings = @movie.movie_timings
  end

  def new
    @movie_timing = MovieTiming.new
    @movie = Movie.find(params[:movie_id])
    @timings = timings_list
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @movie_timing = MovieTiming.find(params[:id])
    @timings = timings_list
  end

  def update
    @movie_timing = MovieTiming.find(params[:id])
    @movie = @movie_timing.movie
    begin
      @movie_timing.update(movie_timing_params)
    rescue ActiveRecord::RecordNotUnique
      @error = "Screen timing is already present."
    end
    respond_to do |f|
      f.js
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie_timing = MovieTiming.new(movie_timing_params)
    begin
      @movie_timing.save
    rescue ActiveRecord::RecordNotUnique
      @error = "Screen timing is already present."
    end
    respond_to do |f|
      f.js
    end
  end

  def destroy
    @movie_timing = MovieTiming.find(params[:id])
    @movie_timing.destroy
  end

  private

  def movie_timing_params
    params.require(:movie_timing).permit(:movie_id, :timing_id, :screening_till, :price_cents)
  end

  def timings_list
    results = []
    Timing.all.each do |timing|
      screen = Screen.find(timing.screen_id)
      theatre = Theatre.find(screen.theatre_id)
      list = [(theatre.name + " - " + screen.name + " @ " + get_screen_time(timing.timing)), timing.id]
      results << list
    end
    return results
  end

  def get_screen_time(timing)
    s,t  = "", ""
    if timing[0..1].to_i < 12
      s = timing + " am"
    elsif timing[0..1].to_i == 12
      if timing[3..].to_i > 0
        s = timing + " pm"
      else
        s = timing + " am"
      end
    else
      s = ((timing[0..1].to_i)-12 ).to_s + timing[2..] + " pm"
    end
    return s
  end
end
