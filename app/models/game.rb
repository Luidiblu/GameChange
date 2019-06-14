class Game < ApplicationRecord
  has_many :lobbies
  has_many :favorites, dependent: :destroy

  validates :name, uniqueness: true

  def self.game_type_presets
    {
      'Duel (2)' => 2,
      '2 x 2 (4)' => 4,
      'Full Team (5)' => 5,
      '3 x 3 (6)' => 6,
      'Full Match (10)' => 10
    }
  end

  include PgSearch
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }


  def is_user_favorite?(user)
    Favorite.where(user: user, game: self).exists?
  end
end
