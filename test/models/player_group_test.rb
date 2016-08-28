require 'test_helper'

class PlayerGroupTest < ActiveSupport::TestCase
  test 'can not have zero players' do
    group = PlayerGroup.create

    assert_errors_on group, :players
  end

  test 'can have one player' do
    player = players(:player_one)
    group = PlayerGroup.create(players: [player])

    assert_equal 1, group.players.count
  end

  test 'can have many players' do
    many = %i(player_one player_two player_three).map { |id| players(id) }
    group = PlayerGroup.create(players: many)

    assert_equal many.count, group.players.count
  end

  test 'can add player' do
    player = players(:player_one)
    group = PlayerGroup.create(players: [player])

    assert_difference('group.players.count') do
      group.players << players(:player_two)
    end
  end
end
