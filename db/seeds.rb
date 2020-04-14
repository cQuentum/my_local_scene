require 'open-uri'
require 'faker'
require 'pry'
require 'json'

GlobalConstants::GENRES

start_seed_time = Time.now

# Fetch all cities in Finistère, store in array
url = "https://geo.api.gouv.fr/departements/29/communes?fields=nom&format=json&geometry=centre"
opened = open(url).read
communes = JSON.parse(opened)
finistere = []
communes.each do |commune|
  finistere << commune['nom']
end

#Seeding Brest
counter = 1
500.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: "#{prefix}#{last_name.delete(' ').downcase}#{suffix}@gmail.com",
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Brest user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
250.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: "#{prefix}#{last_name.delete(' ').downcase}#{suffix}@gmail.com",
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Quimper",
    latitude: 47.9960325,
    longitude: -4.1024782,
    move_radius: rand(1..30),
    genres: ["Rap"].push(GlobalConstants::GENRES_QUIMPER.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Quimper user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
200.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: "#{prefix}#{last_name.delete(' ').downcase}#{suffix}@gmail.com",
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Carhaix",
    latitude: 48.2779589,
    longitude: -3.5620953,
    move_radius: rand(1..30),
    genres: ["Rock"].push(GlobalConstants::GENRES_CARHAIX.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Carhaix user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

total_time = Time.now - start_seed_time

puts "Total users created : #{User.count}"
puts "Fixed seeds done in #{total_time}s"



# Seed user random Finistere

start_seed_time = Time.now
counter = 1
100.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: "#{prefix}#{last_name.delete(' ').downcase}#{suffix}@gmail.com",
    password: "lolilol",
    password_confirmation: "lolilol",
    location: finistere.sample,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3))
  )
  user.save!
  puts "User #{counter} saved!"
  counter += 1
end

# Seed band random Finistere
adjectives = ["Raging", "Flaming", "Incredible", "Mean", "Noisy", "Brilliant", "Anonymous", "Arctic", "Dark", "Solemn"]
counter = 1
500.times do
  user_counter = rand(1..(User.count))
  random_words = Faker::Hipster.words(number: 3)
  band_name = "The #{adjectives.sample.capitalize} #{random_words[0].capitalize} #{random_words[1].capitalize} of #{random_words[2].capitalize}"
  band_genre = GlobalConstants::GENRES.sample
  band = Band.new(
    name: band_name,
    genre: band_genre,
    description: "#{band_name} est le meilleur groupe de #{band_genre} de toute la région !",
    external_link: "ceciestunlien.io"
    )
  band.user = User.find(user_counter)
  band.save!
  puts "Band #{counter} - #{band.name} owned by #{band.user.first_name} saved!"
  counter += 1
end


# Seed concert

500.times do
  band = Band.find(rand(1..(Band.count)))
  address = band.user.location
  starting_hour = ["19", "20", "21"]
  start_time = DateTime.strptime("#{rand(17..30)}/04/20 #{starting_hour.sample}:00", "%d/%m/%y %H:%M")
  end_time = start_time + ((rand(1..3)/24.0))
  concert = Concert.new(
    title: "#{band.name} à #{address}",
    address: address,
    longitude: band.user.longitude,
    latitude: band.user.latitude,
    description: "Premier concert à la maison, venez nombreux nous soutenir !",
    external_link: "ceciestaussiunlienmaisdifferent.io",
    price_cents: (rand(5..14) * 100),
    confirmed: true,
    start_time: start_time,
    end_time: end_time,
    skip_geocoding: true
    )

  concert.band = band
  concert.save!
  puts "Concert n°#{concert.id} saved!"
end

total_time = Time.now - start_seed_time

puts "Geocoded seeds done in #{total_time}s"


# Add our accounts

adrien = User.new(
    first_name: "Adrien"
    last_name: "Abadou",
    email: "abadou@gmail.com"
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
adrien.save!

jerome = User.new(
    first_name: "Jerome"
    last_name: "Luce",
    email: "luce@gmail.com"
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
jerome.save!

paul = User.new(
    first_name: "Paul"
    last_name: "Fourchon",
    email: "fourchon@gmail.com"
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
paul.save!

quentin = User.new(
    first_name: "Quentin"
    last_name: "Messager",
    email: "messager@gmail.com"
    password: "lolilol",
    password_confirmation: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
quentin.save!
