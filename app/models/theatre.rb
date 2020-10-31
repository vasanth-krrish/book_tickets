class Theatre < ApplicationRecord
  has_many :screens

  has_one_attached :image
  validate :image_format

  private

  def image_format
    return unless image.attached?
    if ["image/png", "image/jpeg"].include?(image.blob.content_type)
      if image.blob.byte_size > 5.megabytes
        errors.add(:image, 'size needs to be less than 5MB')
        image.delete
      end
    else
      image.delete
      errors.add(:image, 'needs to be jpeg or png image')
    end
  end
end
