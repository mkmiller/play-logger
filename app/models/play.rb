# The play model
class Play < ApplicationRecord
  validates :game, presence: true
  validates :players, presence: true
  validates :winners, presence: true

  belongs_to :game
  belongs_to :player_group
  belongs_to :winner_group, class_name: 'PlayerGroup'

  delegate :players, to: :player_group, allow_nil: true

  def winners
    winner_group.players if winner_group.present?
  end
end
