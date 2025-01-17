gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
require 'pry'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    rooms = [
      @room_1 = Room.new(:bedroom, 10, 13),
      @room_2 = Room.new(:bedroom, 11, 15),
      @room_3 = Room.new(:living_room, 25, 15),
      @room_4 = Room.new(:basement, 30, 41)
  ]
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_has_price
    assert_equal "$400000", @house.price
  end

  def test_it_has_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_can_have_rooms
    assert_equal [], @house.rooms
  end

  def test_rooms_can_contain_room
    assert_equal [@room_1], @house.add_room(@room_1)
  end

  def test_new_rooms_can_be_added_to_room_array
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal @house.rooms,  @house.rooms
  end

  def test_rooms_in_category
    @rooms = [@room_1, @room_2, @room_3, @room_4]
    assert_equal [@room_1, @room_2], @house.rooms_in_category(:bedroom)
    assert_equal [@room_4], @house.rooms_in_category(:basement)
    end

end
