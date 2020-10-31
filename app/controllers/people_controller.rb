class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end

  def edit
    @person = Person.find(params[:id])
  end

  def show
    @person = Person.find(params[:id])
    @movies = @person.movie_casts.each.map {|r| Movie.find(r.movie_id) } +
              @person.movie_crews.each.map {|r| Movie.find(r.movie_id) }
  end

  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    if @person.errors.any?
      @error = @person.person + " " + @person.errors.messages[:person][0]
    end
    respond_to do |format|
      format.js
    end
  end

  # POST /languages
  # POST /languages.json
  def create
    @person = Person.new(person_params)
    @person.save
    if @person.errors.any?
      @error = @person.person + " " + @person.errors.messages[:person][0]
    end
    respond_to do |format|
      format.js
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @person = Person.find(params[:id])
    begin
      @person.destroy
    rescue
      @error = "#{@person.name} can not be deleted as it is used already"
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :avatar)
    end
end
