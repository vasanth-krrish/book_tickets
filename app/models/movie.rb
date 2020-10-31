class Movie < ApplicationRecord
  has_many :movie_languages , dependent: :destroy
  has_many :languages, through: :movie_languages
  accepts_nested_attributes_for :languages

  has_many :movie_genres , dependent: :destroy
  has_many :genres, through: :movie_genres
  accepts_nested_attributes_for :genres

  has_many :movie_casts , dependent: :destroy
  has_many :persons, through: :movie_casts

  has_many :movie_crews , dependent: :destroy
  has_many :persons, through: :movie_crews

  has_many :movie_timings
  has_many :timings, through: :movie_timings

  has_one_attached :image
  validate :image_format

  private

  def image_format
    return unless image.attached?
    if ["image/png", "image/jpeg"].include?(image.blob.content_type)
      if image.blob.byte_size > 10.megabytes
        errors.add(:image, 'size needs to be less than 10 MB')
        image.delete
      end
    else
      image.delete
      errors.add(:image, 'needs to be jpeg or png image')
    end
  end
end
