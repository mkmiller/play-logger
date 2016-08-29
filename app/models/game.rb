# The game model
class Game < ApplicationRecord
  validates :name, presence: true

  has_many :plays
end
