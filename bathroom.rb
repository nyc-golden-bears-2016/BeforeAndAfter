require 'geocoder'
require 'open-uri'
require 'json'
require 'geokit'

class Bathroom
  attr_reader :borough, :location, :park_name, :open_year_round, :lat_long

  def initialize(options = {})
    @borough = options.fetch("borough" ,"")
    @location = options.fetch("location", "")
    @park_name = options.fetch("name", "")
    @open_year_round = options.fetch("open_year_round", "")
  end

  def set_ll
    @lat_long = Geokit::Geocoders::GoogleGeocoder.geocode @location
  end

end

# data = JSON.parse(open("https://data.cityofnewyork.us/resource/r27e-u3sy.json").read)
# p data

# bathrooms = data.map do |room|
#   Bathroom.new(room)
# end

# p bathroom
