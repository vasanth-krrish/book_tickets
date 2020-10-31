class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validate :avatar_format
  has_many :tickets
  
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
