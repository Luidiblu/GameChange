class Lobby < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
  belongs_to :game

  validates :description, presence: true
end
