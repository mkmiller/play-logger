require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'has two fixtures' do
    assert_equal 2, Game.count
  end

  test 'has to have name' do
    game = Game.create

    assert_errors_on game, :name
  end
end
