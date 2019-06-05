class Session < ApplicationRecord
  belongs_to :user
  belongs_to :lobby

  validates :lobby, uniqueness: { scope: :user }
end
