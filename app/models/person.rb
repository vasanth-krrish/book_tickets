class Person < ApplicationRecord
  has_many :movie_casts
  has_many :movies, through: :movie_casts

  has_many :movie_crews
  has_many :movies, through: :movie_crews

  has_one_attached :avatar
  validate :avatar_format

  private

  def avatar_format
    return unless avatar.attached?
    if ["image/png", "image/jpeg"].include?(avatar.blob.content_type)
      if avatar.blob.byte_size > 5.megabytes
        errors.add(:avatar, 'size needs to be less than 5MB')
        avatar.delete
      end
    else
      avatar.delete
      errors.add(:avatar, 'needs to be jpeg or png image')
    end
  end
end
