# Create the PlayerGroup model
class CreatePlayerGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :player_groups, &:timestamps
  end
end
