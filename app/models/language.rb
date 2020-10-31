class Language < ApplicationRecord
  validates :language, presence: true, uniqueness: true
  has_many :movie_languages
  has_many :movies, through: :movie_languages
end
