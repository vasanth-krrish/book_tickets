class MovieTiming < ApplicationRecord
  belongs_to :movie
  belongs_to :timing
  has_many :tickets
end
