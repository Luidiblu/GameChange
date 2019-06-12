class Lobby < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
  has_many :messages

  belongs_to :game
  belongs_to :user

  validates :description, presence: true
  validates :max_players, presence: true

  before_create :set_session_token

  def user_allowed?(user)
    # TODO

    # membro
    # member = self.users.include? user

    # cheio
    fits_in_lobby = self.max_players > self.sessions.select(&:active?).count

    # ja tem outra sessao
    already_in_session = user.sessions.any?(&:active?)

    return fits_in_lobby && !already_in_session
  end

  def move_admin
    self.user = self.sessions.find_by(active: true).user
    self.save
  end

  def set_session_token
    opentok = OpenTok::OpenTok.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_API_KEY']
    session = opentok.create_session :media_mode => :routed

    self.session_token = session.session_id
    self.generated_token = session.generate_token
  end
end
