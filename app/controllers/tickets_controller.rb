class TicketsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
  end

  def new
    @movie_timing = MovieTiming.find(params[:movie_timing_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(tickets_params)
    if @ticket.save
      TicketMailer.with(ticket: @ticket).send_ticket.deliver_later
      redirect_to user_tickets_path
    else
      render 'new'
    end
  end

  def show
    @tickets = current_user.tickets
  end

  private

  def tickets_params
    params.require(:ticket).permit(:movie_timing_id, :user_id, :price_cents, :booking_date, :quantity)
  end
end
