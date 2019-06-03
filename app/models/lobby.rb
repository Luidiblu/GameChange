class Lobby < ApplicationRecord
  belongs_to :game
  has_many :users, through: :sessions
end
