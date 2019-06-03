class Game < ApplicationRecord
  validates :name, uniqueness: true
end
