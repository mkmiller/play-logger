require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'has three fixtures' do
    assert_equal 3, Player.count
  end

  test 'has to have name' do
    player = Player.create

    assert_errors_on player, :name
  end

  test 'can belong to more than one group' do
    player = players(:player_one)

    3.times { PlayerGroup.create(players: [player]) }

    assert_equal 3, player.player_groups.count
  end
end
