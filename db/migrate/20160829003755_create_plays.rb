# Create the play model
class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.integer :game_id
      t.integer :player_group_id
      t.integer :winner_group_id
      t.datetime :played_at

      t.timestamps
    end
  end
end
