class MovieCrewsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @movie_crew = MovieCrew.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie_crew = MovieCrew.new(movie_crew_params)
    begin
      @movie_crew.save
    rescue
      @errors = "Error"
    end
    respond_to do |f|
      f.js
    end
  end

  def destroy
    @movie_crew = MovieCrew.find(params[:id])
    @movie_crew.delete
    respond_to do |f|
      f.js
    end
  end

  private

  def movie_crew_params
    params.require(:movie_crew).permit(:movie_id, :person_id, :job)
  end
end
