# Create the join table for the Players/PlayerGroups
class CreatePlayerGroupPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :player_group_players do |t|
      t.integer :player_id
      t.integer :player_group_id

      t.timestamps
    end
  end
end
