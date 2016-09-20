require 'test_helper'

class PlayerGroupTest < ActiveSupport::TestCase
  test 'can not have zero players' do
    group = PlayerGroup.create

    assert_errors_on group, :players
  end

  test 'can have one player' do
    group = PlayerGroup.create(players: [create(:player)])

    assert_equal 1, group.players.count
  end

  test 'can have many players' do
    many = (1..3).map { create(:player) }
    group = PlayerGroup.create(players: many)

    assert_equal many.count, group.players.count
  end

  test 'can add player' do
    group = PlayerGroup.create(players: [create(:player)])

    assert_difference('group.players.count') do
      group.players << create(:player)
    end
  end

  test 'can create groups uniquely' do
    player = create(:player)
    PlayerGroup.find_or_create(players: [player])

    assert_no_difference('PlayerGroup.count') do
      2.times { PlayerGroup.find_or_create(players: [player]) }
    end
  end

  test 'can create groups uniquely order independent' do
    player1 = create(:player)
    player2 = create(:player)

    group1 = PlayerGroup.create(players: [player1, player2])

    assert_no_difference('PlayerGroup.count') do
      group2 = PlayerGroup.find_or_create(players: [player2, player1])

      assert_equal group1, group2
    end
  end

  test 'find with no arguments returns empty' do
    assert_nil PlayerGroup.find_or_create(players: [])
  end
end
