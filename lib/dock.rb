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
        @boats.each do |boat|
            boat.add_hour
        end
    end

end