# The player model
class Player < ApplicationRecord
  validates :name, presence: true

  has_many :player_group_players
  has_many :player_groups, through: :player_group_players
end
