# A grouping of 1 or more players
class PlayerGroup < ApplicationRecord
  validates :players, presence: true

  has_many :player_group_players
  has_many :players, through: :player_group_players

  def self.names_from(players)
    Set.new players.map(&:name)
  end

  def self.find_or_create(attributes)
    players = attributes[:players]
    names = names_from(players)

    find_each do |group|
      return group if names_from(group.players) == names
    end

    create(attributes) unless players.empty?
  end
end
