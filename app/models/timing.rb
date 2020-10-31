class Timing < ApplicationRecord
  belongs_to :screen
  validates :timing, presence: true, uniqueness: true
  has_many :movie_timings
  has_many :movies, through: :movie_timings
end
