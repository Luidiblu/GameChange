class Session < ApplicationRecord
  belongs_to :user
  belongs_to :lobby
end
