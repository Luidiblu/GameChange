class AddUserToLobby < ActiveRecord::Migration[5.2]
  def change
    add_reference :lobbies, :user, foreign_key: true
  end
end
