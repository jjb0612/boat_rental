require 'pry'
require './lib/boat'
require './lib/renter'

class Dock

    attr_reader :name,
                :max_rental_time,
                :boats,
                :renter
    def initialize(name, max_rental_time)
        @name = name
        @max_rental_time = max_rental_time
        @renter = []
        @boats = []
    end

    def rent(boat, renter)
        @renter << renter
        @boats << boat
    end

    def log_hour
        time_limit = @max_rental_time
        @boats.each do |boat|
            if boat.hours_rented < time_limit
                boat.add_hour
            end
        end
    end

    def revenue
        total = 0
        @boats.each do |boat|
            total += (boat.hours_rented * boat.price_per_hour)
        end
        total
    end

end