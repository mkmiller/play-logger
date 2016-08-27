# The game model
class Game < ApplicationRecord
  validates :name, presence: true
end
