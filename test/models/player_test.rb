require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'has two fixtures' do
    assert_equal 2, Player.count
  end

  test 'has to have name' do
    player = Player.create

    assert_errors_on player, :name
  end
end
