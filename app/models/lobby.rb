class Lobby < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions

  belongs_to :game
  belongs_to :user

  validates :description, presence: true
  validates :max_players, presence: true

  def user_allowed?(user)
    # TODO

    # membro
    member = self.users.include? user

    # cheio
    fits_in_lobby = self.max_players > self.sessions.count

    # ja tem outra sessao
    already_in_session = user.sessions.any?(&:active?)

    return !member && fits_in_lobby && !already_in_session
  end
end
