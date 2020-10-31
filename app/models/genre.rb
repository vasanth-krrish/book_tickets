class Genre < ApplicationRecord
  validates :genre, presence: true, uniqueness: true
  has_many :movie_genres
  has_many :movies, through: :movie_genres
end
