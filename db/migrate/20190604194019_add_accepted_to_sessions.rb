class AddAcceptedToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :accepted, :boolean
  end
end
