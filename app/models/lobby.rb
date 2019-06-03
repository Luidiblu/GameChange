class Lobby < ApplicationRecord
  has_many :users, through: :sessions
end
