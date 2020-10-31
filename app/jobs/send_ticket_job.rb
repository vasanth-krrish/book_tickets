class SendTicketJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    TicketMailer.with(ticket: @ticket).send_ticket.deliver_later
  end
end
