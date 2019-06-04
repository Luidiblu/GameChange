class Lobby < ApplicationRecord
  has_many :users, through: :sessions
  belongs_to :game
end
