# The join table for PlayerGroups and Players
class PlayerGroupPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :player_group
end
