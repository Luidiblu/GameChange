class User < ApplicationRecord
  has_many :lobbies, through: :sessions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :banner_img, BannerImgUploader

end
