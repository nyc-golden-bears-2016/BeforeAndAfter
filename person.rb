require 'geokit'
require_relative 'bathroom'

class Person
  attr_accessor :location, :lat_long
  def initialize
    set_current_location
  end

  def set_current_location
    puts "What is your current locataion"
    @location = gets.chomp
    set_ll
  end

  def set_ll
    @lat_long = Geokit::Geocoders::GoogleGeocoder.geocode "#{location}"
  end

  # def find_near_by_bathrooms(distance)
  #   set_current_location
  # end

end


# a = Person.new
