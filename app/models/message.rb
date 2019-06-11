class Message < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validates :content, presence: true, allow_blank: false

  after_create :broadcast_message

  def from?(an_user)
    an_user == self.user
  end

  def broadcast_message
    ActionCable.server.broadcast(
      "lobby_#{self.lobby.id}",
      message_partial: ApplicationController.renderer.render(
        partial: 'messages/message',
        locals: {
          message: self,
          user_is_messages_author: false
        }
      )
    )
  end
end
