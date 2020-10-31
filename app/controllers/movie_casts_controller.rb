class MovieCastsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @movie_cast = MovieCast.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie_cast = MovieCast.new(movie_cast_params)
    begin
      @movie_cast.save
    rescue
      @errors = "Error"
    end
    respond_to do |f|
      f.js
    end
  end

  def destroy
    @movie_cast = MovieCast.find(params[:id])
    @movie_cast.delete
    respond_to do |f|
      f.js
    end
  end

  private

  def movie_cast_params
    params.require(:movie_cast).permit(:movie_id, :person_id, :character)
  end
end
