class Ticket < ApplicationRecord
  belongs_to :movie_timing
  belongs_to :user
end
