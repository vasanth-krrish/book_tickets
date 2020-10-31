class SearchController < ApplicationController
  def create
    search = params[:search].downcase
    redirect_back fallback_location: root_path if (search == "" or search == " ")
    @results, @persons = [], []
    Genre.all.map {|e| [e.genre.downcase, e.id]}.each do |genre|
      if genre[0] == search
        @genre = Genre.find(genre[1])
      end
    end
    Language.all.map {|e| [e.language.downcase, e.id]}.each do |language|
      if language[0] == search
        @language = Language.find(language[1])
      end
    end
    Person.all.map {|r| [r.name.downcase, r.id]}.each do |person|
      if person[0].include?(search)
        @persons << person[1]
      end
    end
    movies =
    (MovieCast.all.map {|r| [r.movie_id, r.person_id]}.each.
      map {|r| [Person.find(r[1]).name.downcase, r[0]]}) +
      (MovieCrew.all.map {|r| [r.movie_id, r.person_id]}.each.
        map {|r| [Person.find(r[1]).name.downcase, r[0]]}) +
        (Movie.all.map {|m| [m.name.downcase, m.id]})
    movies.each do |m|
      @results << m[1] if m[0].include?(search)
    end
  end
end
