require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'has to have name' do
    game = Game.create

    assert_errors_on game, :name
  end

  test 'can have zero plays' do
    game = create(:game)

    assert_equal 0, game.plays.count
  end

  test 'can have many plays' do
    game = create(:game)
    count = 3

    count.times do
      group = PlayerGroup.create(players: [create(:player)])
      Play.create(game: game, player_group: group, winner_group: group)
    end

    assert_equal count, game.plays.count
  end
end
