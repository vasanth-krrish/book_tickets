class AddBookingDateToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :booking_date, :date
  end
end
