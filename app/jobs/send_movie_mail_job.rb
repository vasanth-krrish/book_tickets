class SendMovieMailJob < ApplicationJob
  queue_as :default

  def perform(movie)
    User.all.each do |user|
      MoviesMailer.with(movie: movie, user: user).new_movie_mail.deliver_later
    end
  end
end
