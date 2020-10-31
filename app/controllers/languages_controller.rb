class LanguagesController < ApplicationController
  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
    @movies = @language.movies
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    @language.update(language_params)
    if @language.errors.any?
      @error = @language.language + " " + @language.errors.messages[:language][0]
    end
    respond_to do |format|
      format.js
    end
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(language_params)
    @language.save
    if @language.errors.any?
      @error = @language.language + " " + @language.errors.messages[:language][0]
    end
    respond_to do |format|
      format.js
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language = Language.find(params[:id])
    begin
      @language.destroy
    rescue
      @error = "#{@language.language} can not be deleted as it is used already"
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def language_params
      params.require(:language).permit(:language)
    end
end
