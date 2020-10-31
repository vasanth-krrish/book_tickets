class MoviesMailer < ApplicationMailer
  def new_movie_mail
    @movie = params[:movie]
    @user = params[:user]
    @language = ""
    @movie.languages.each do |lang|
      @language << lang.language + " "
    end
    @genre = ""
    @movie.genres.each do |genre|
      @genre << genre.genre + " "
    end

    mail(to: @user.email, subject: "New Movie has been added!")
  end
end
