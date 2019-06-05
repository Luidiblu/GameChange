class AddDescriptionToLobbies < ActiveRecord::Migration[5.2]
  def change
    add_column :lobbies, :description, :string
  end
end
