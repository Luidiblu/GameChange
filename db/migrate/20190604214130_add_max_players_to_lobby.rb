class AddMaxPlayersToLobby < ActiveRecord::Migration[5.2]
  def change
    add_column :lobbies, :max_players, :integer
  end
end
