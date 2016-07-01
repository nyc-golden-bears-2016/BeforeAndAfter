require 'geocoder'
require 'open-uri'
require 'json'
require 'geokit'
require 'yelp'
require_relative "person"
require_relative "bathroom"


data = JSON.parse(open("https://data.cityofnewyork.us/resource/r27e-u3sy.json").read)

bathrooms = data.map do |room|
  Bathroom.new(room)
end


manhattan_bathrooms = bathrooms.select{|room| room.borough == "Manhattan"}


our_five = manhattan_bathrooms[0..5]
our_five.each do |bathroom|
   bathroom.set_ll
end

bob = Person.new

class Program
  attr_accessor :bathrooms, :person, :restaurants

  def initialize(bathrooms, person)
    @bathrooms = bathrooms
    @person = person
    @restaurants = get_restaurants
    @picked_restaurant = Geokit::Geocoders::GoogleGeocoder.geocode choose_restaurant
  end

  def find_nearby_bathrooms
    puts ""
    @bathrooms.each do |bathroom|
     puts bathroom.location
     puts ""
     puts "You are #{@picked_restaurant.distance_to(bathroom.lat_long).round} mile(s) from you bathroom!"
    end
  end

  def get_restaurants
    puts "your city!"
    city = gets.chomp
    Yelp.client.configure do |config|
      config.consumer_key = 'bytTvgc91BK94JzLLhtL1Q'
      config.consumer_secret = '955SOj7o3ttl3jGmCglKmlyaVWc'
      config.token = 'WVAeWyTJXdPhaiXfheFxZu_fOMS5GimN'
      config.token_secret = 'Dsj0P1P7KiyVZQqW8IClNE4u3hk'
    end
    params = { term: 'food',
           limit: 5,
         }
    test = Yelp.client.search("#{city}", params)
    test.businesses.map.with_index do |business, idx|
      puts business.rating
      puts "#{(idx+1)}: #{business.name}"
      puts '----------'
      business
    end
  end

  def run
    find_nearby_bathrooms
  end

  def choose_restaurant
    puts "Please enter from 1-5 which restaurant you want"
    answer = gets.chomp.to_i - 1

    restaurants[answer].location.address.to_s
  end

end

# Yelp.client.configure do |config|
#   config.consumer_key = 'bytTvgc91BK94JzLLhtL1Q'
#   config.consumer_secret = '955SOj7o3ttl3jGmCglKmlyaVWc'
#   config.token = 'WVAeWyTJXdPhaiXfheFxZu_fOMS5GimN'
#   config.token_secret = 'Dsj0P1P7KiyVZQqW8IClNE4u3hk'
# end

# puts "Enter your city"
# city = gets.chomp

# params = { term: 'food',
#            limit: 5,
#          }

# test = Yelp.client.search("#{city}", params)

# test.businesses.each do |business|
#   puts business.rating
#   puts business.name
#   puts '----------'
# end


walter = Program.new(our_five, bob)
walter.run

