class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def settings
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @language = Language.new
    @genre = Genre.new
  end

  def edit
    @language = Language.new
    @genre = Genre.new

    @languages = ""
    @movie.languages.map { |e| e.id }.each do |i|
      @languages << i.to_s
    end

    @genres = ""
    @movie.genres.map { |e| e.id }.each do |i|
      @genres << i.to_s
    end
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        params[:movie][:language][:language].each do |i|
          MovieLanguage.create(movie_id: @movie.id, language_id: i.to_i)
        end
        params[:movie][:genre][:genre].each do |i|
          MovieGenre.create(movie_id: @movie.id, genre_id: i.to_i)
        end

        SendMovieMailJob.perform_later(@movie)

        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        update_langs(params[:movie][:language][:language])
        update_genres(params[:movie][:genre][:genre])

        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @languages = @movie.languages
    @genres = @movie.genres
  end

  def destroy
    @movie.image.delete if @movie.image.attached?
    @movie.destroy
    redirect_to root_path
  end

  private

  def update_langs(language)
    langs = @movie.languages.map { |e| e.id.to_s }

    to_add = language - langs
    to_delete = langs - language

    to_add.each do |i|
      MovieLanguage.create(movie_id: @movie.id, language_id: i.to_i)
    end

    to_delete.each do |i|
      MovieLanguage.find_by(movie_id: @movie.id, language_id: i.to_i).delete
    end
  end

  def update_genres(genre)
    movie = @movie.genres.map { |e| e.id.to_s }

    to_add = genre - movie
    to_delete = movie - genre

    to_add.each do |i|
      MovieGenre.create(movie_id: @movie.id, genre_id: i.to_i)
    end

    to_delete.each do |i|
      MovieGenre.find_by(movie_id: @movie.id, genre_id: i.to_i).delete
    end
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :synopsis, :premiere, :runtime, :image)
  end
end
