class AddTokensToLobbies < ActiveRecord::Migration[5.2]
  def change
    add_column :lobbies, :session_token, :string
    add_column :lobbies, :generated_token, :string
  end
end
