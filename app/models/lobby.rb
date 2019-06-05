class Lobby < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions

  belongs_to :game
  belongs_to :user

  validates :description, presence: true
  validates :max_players, presence: true
end
