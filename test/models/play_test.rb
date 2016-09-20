require 'test_helper'

class PlayTest < ActiveSupport::TestCase
  test 'must have game, players and winners' do
    play = Play.create

    assert_errors_on play, :game, :players, :winners,
                     :player_group, :winner_group
  end

  test 'can inspect players' do
    player = create(:player)
    group = PlayerGroup.create(players: [player, create(:player)])
    winner = PlayerGroup.create(players: [player])
    play = Play.create(game: create(:game),
                       player_group: group, winner_group: winner)

    assert_equal 2, play.players.count
    assert_equal 1, play.winners.count
  end
end
