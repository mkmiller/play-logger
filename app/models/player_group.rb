# A grouping of 1 or more players
class PlayerGroup < ApplicationRecord
  validates :players, presence: true

  has_many :player_group_players
  has_many :players, through: :player_group_players
end
