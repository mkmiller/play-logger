require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'has two fixtures' do
    assert_equal 2, Game.count
  end

  test 'has to have name' do
    game = Game.create

    assert_errors_on game, :name
  end

  test 'can have zero plays' do
    game = Game.create(name: 'Mice & Mystics')

    assert_equal 0, game.plays.count
  end

  test 'can have many plays' do
    game = Game.create(name: 'Onirim')

    solo_players = %i(player_one player_two)
    solo_players.map do |id|
      player = players(id)
      group = PlayerGroup.create(players: [player])
      Play.create(game: game, player_group: group, winner_group: group)
    end

    assert_equal solo_players.count, game.plays.count
  end
end
