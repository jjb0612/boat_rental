require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'

class DockTest < Minitest::Test

    def test_it_exists
        dock = Dock.new("The Rowing Duck", 3)
        assert_instance_of Dock, dock
    end

    def test_it_has_attributes
        dock = Dock.new("The Rowing Duck", 3)
        assert_equal "The Rowing Duck", dock.name
        assert_equal 3, dock.max_rental_time
    end

    def test_it_can_store_info_on_boats_and_renter
       dock = Dock.new("The Rowing Dock", 3)
       kayak_1 = Boat.new(:kayak, 20)
       kayak_2 = Boat.new(:kayak, 20)    
       canoe = Boat.new(:canoe, 25)   
       sup_1 = Boat.new(:standup_paddle_board, 15)    
       sup_2 = Boat.new(:standup_paddle_board, 15)    
       patrick = Renter.new("Patrick Star", "4242424242424242")
       eugene = Renter.new("Eugene Crabs", "1313131313131313")
       dock.rent(kayak_1, patrick)
       dock.rent(kayak_2, patrick)
       assert_equal [kayak_1, kayak_2], dock.boats
       assert_equal [patrick, patrick], dock.renter
    end

    def test_log_hour_will_add_one_to_hours_rented
       dock = Dock.new("The Rowing Dock", 3)
       kayak_1 = Boat.new(:kayak, 20)
       kayak_2 = Boat.new(:kayak, 20)    
       canoe = Boat.new(:canoe, 25)   
       sup_1 = Boat.new(:standup_paddle_board, 15)    
       sup_2 = Boat.new(:standup_paddle_board, 15)    
       patrick = Renter.new("Patrick Star", "4242424242424242")
       eugene = Renter.new("Eugene Crabs", "1313131313131313")
       dock.rent(kayak_1, patrick)
       dock.rent(kayak_2, patrick)
       dock.log_hour
       dock.log_hour
       assert_equal 2, kayak_1.hours_rented
       assert_equal 2, kayak_2.hours_rented
    end

    def test_log_hour_will_not_add_over_the_max_rental_time
       dock = Dock.new("The Rowing Dock", 3)
       kayak_1 = Boat.new(:kayak, 20)
       kayak_2 = Boat.new(:kayak, 20)        
       patrick = Renter.new("Patrick Star", "4242424242424242")
       dock.rent(kayak_1, patrick)
       dock.rent(kayak_2, patrick)
       dock.log_hour
       dock.log_hour
       dock.log_hour
       dock.log_hour
       assert_equal 3, kayak_1.hours_rented
       assert_equal 3, kayak_2.hours_rented
    end

    def test_it_will_return_boat
       dock = Dock.new("The Rowing Dock", 3)
       kayak_1 = Boat.new(:kayak, 20)
       kayak_2 = Boat.new(:kayak, 20)    
       canoe = Boat.new(:canoe, 25)   
       sup_1 = Boat.new(:standup_paddle_board, 15)    
       sup_2 = Boat.new(:standup_paddle_board, 15)    
       patrick = Renter.new("Patrick Star", "4242424242424242")
       eugene = Renter.new("Eugene Crabs", "1313131313131313")
       dock.rent(kayak_1, patrick)
       dock.rent(kayak_2, patrick)
       dock.log_hour
       dock.rent(canoe, patrick)
       dock.log_hour
       dock.return(kayak_1)
       dock.return(kayak_2)
       dock.return(canoe)
       assert_equal [], dock.boats
    end

    def test_it_can_calculate_revenue
        dock = Dock.new("The Rowing Dock", 3)
        kayak_1 = Boat.new(:kayak, 20)
        kayak_2 = Boat.new(:kayak, 20)    
        canoe = Boat.new(:canoe, 25)      
        patrick = Renter.new("Patrick Star", "4242424242424242")
        dock.rent(kayak_1, patrick)
        dock.rent(kayak_2, patrick)
        dock.log_hour
        dock.rent(canoe, patrick)
        dock.log_hour
        assert_equal 105, dock.revenue
    end

end