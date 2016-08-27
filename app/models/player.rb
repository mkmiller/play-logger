# The player model
class Player < ApplicationRecord
  validates :name, presence: true
end
