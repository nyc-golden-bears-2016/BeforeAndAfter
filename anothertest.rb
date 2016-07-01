require 'yelp'


Yelp.client.configure do |config|
  config.consumer_key = 'bytTvgc91BK94JzLLhtL1Q'
  config.consumer_secret = '955SOj7o3ttl3jGmCglKmlyaVWc'
  config.token = 'WVAeWyTJXdPhaiXfheFxZu_fOMS5GimN'
  config.token_secret = 'Dsj0P1P7KiyVZQqW8IClNE4u3hk'
end

puts "Enter your city"
city = gets.chomp

params = { term: 'food',
           limit: 5,
         }

test = Yelp.client.search("#{city}", params)

test.businesses.each do |business|
  puts business.rating
  puts business.name
  puts '----------'
end
