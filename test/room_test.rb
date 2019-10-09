gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'


class RoomTest < Minitest::Test
  def setup
    @room = Room.new(:bedroom, 10, 13)
  end


  def test_it_exists
    assert_instance_of Room, @room
  end

  def test_it_has_a_category
    assert_equal :bedroom, @room.category
  end

  def test_it_can_have_different_category
    room_1 = Room.new(:kitchen, 10, 13)
    assert_equal :kitchen, room_1.category
  end

  def test_it_has_length_and_width
    assert_equal 10, @room.length
    assert_equal 13, @room.width
  end

  def test_it_calculates_sq_feet
    assert_equal 130, @room.sq_feet
  end

end
