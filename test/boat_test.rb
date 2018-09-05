require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require 'pry'

class BoatTest < Minitest::Test

    def test_it_exists
        kayak = Boat.new(:kayak, 20)
        assert_instance_of Boat, kayak
    end

    def test_it_has_attributes
        kayak = Boat.new(:kayak, 20)
        assert_equal :kayak, kayak.type
        assert_equal 20, kayak.price_per_hour
    end

    def test_it_can_show_hours_rented
        kayak = Boat.new(:kayak, 20)
        assert_equal 0, kayak.hours_rented
    end

    def test_it_can_add_hours
        kayak = Boat.new(:kayak, 20)
        kayak.add_hour
        assert_equal 2, kayak.add_hour
        assert_equal 2, kayak.hours_rented
    end

end