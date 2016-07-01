require 'geocoder'
require 'open-uri'
require 'json'
require 'geokit'
require_relative "person"
require_relative "bathroom"


# data = JSON.parse(open("https://data.cityofnewyork.us/resource/r27e-u3sy.json").read)
# puts "on line 10"

# bathrooms = data.map do |room|
#   Bathroom.new(room)
# end


# p bathrooms

# manhattan_bathrooms = bathrooms.select{|room| room.borough == "Manhattan"}

# manhattan_bathrooms.count

# Venue.near(manhattan_bathrooms.first.location)

a = Bathroom.new({"borough" => "Brooklyn", "location" => "Geary St, San Francisco, CA", "park_name" => "100% playground", "open_year_round" => "Yes"})

b = Person.new



class Program
  attr_accessor :bathrooms, :person

  def initialize(bathrooms, person)
    @bathrooms = bathrooms
    @person = person
  end

  def find_nearby_bathrooms
    # @bathrooms.each do |bathroom|
     puts "You are #{person.lat_long.distance_to(bathrooms.lat_long).round} mile(s) from you bathroom!"
    # end
  end

  def find_near_by_restaurants

  end

  def find_near_by_bathroom_and_restaurants
    find_nearby_bathrooms
    find_near_by_restaurants
  end

end



walter = Program.new(a, b)
walter.find_nearby_bathrooms


