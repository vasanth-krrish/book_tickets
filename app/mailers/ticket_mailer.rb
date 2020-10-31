class TicketMailer < ApplicationMailer
  def send_ticket
    @ticket = params[:ticket]
    mail(to: @ticket.user.email, subject: "Your ticket for #{@ticket.movie_timing.movie.name} has receieved!")
  end
end
