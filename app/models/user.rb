class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :lobbies, through: :sessions
  has_many :favorites, dependent: :destroy
  has_many :games, through: :favorites

  has_many :messages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :banner_img, AvatarUploader
end
