class GenresController < ApplicationController
  # GET /languages
  # GET /languages.json
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    if @genre.errors.any?
      @error = @genre.genre + " " + @genre.errors.messages[:genre][0]
    end
    respond_to do |format|
      format.js
    end
  end

  # POST /languages
  # POST /languages.json
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    if @genre.errors.any?
      @error = @genre.genre + " " + @genre.errors.messages[:genre][0]
    end
    respond_to do |format|
      format.js
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @genre = Genre.find(params[:id])
    begin
      @genre.destroy
    rescue
      @error = "#{@genre.genre} can not be deleted as it is used already"
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:genre)
    end
end
