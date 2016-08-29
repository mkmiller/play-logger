require 'test_helper'

class PlayTest < ActiveSupport::TestCase
  test 'must have game, players and winners' do
    play = Play.create

    assert_errors_on play, :game, :players, :winners,
                     :player_group, :winner_group
  end

  test 'can inspect players' do
    game = games(:twixt)
    player_one = players(:player_one)
    player_two = players(:player_two)
    group = PlayerGroup.create(players: [player_one, player_two])
    winner = PlayerGroup.create(players: [player_one])
    play = Play.create(game: game, player_group: group, winner_group: winner)

    assert_equal 2, play.players.count
    assert_equal 1, play.winners.count
  end
end
