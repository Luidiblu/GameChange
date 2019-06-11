class Message < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validates :content, presence: true, allow_blank: false

  def from?(an_user)
    an_user == self.user
  end
end
