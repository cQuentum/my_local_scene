require 'open-uri'
require 'faker'
require 'pry'
require 'json'

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
320.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    password: "lolilol",
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
218.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    password: "lolilol",
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
140.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    password: "lolilol",
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
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: finistere.sample,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3))
  )
  user.save!
  puts "User #{counter} saved!"
  counter += 1
end

# Seed band random Finistere
adjectives = %w(Raging Flaming Incredible Mean Noisy Brilliant Anonymous Arctic Dark Solemn)
counter = 1
220.times do
  user_counter = rand(1..(User.count))
  random_words = Faker::Hipster.words(number: 3)
  band_name = "The #{adjectives.sample} #{random_words[0].capitalize} #{random_words[1].capitalize} of #{random_words[2].capitalize}"
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

456.times do
  band = Band.find(rand(1..(Band.count)))
  address = band.user.location
  starting_hour = ["19", "20", "21"]
  start_time = DateTime.strptime("#{rand(17..30)}/04/20 #{starting_hour.sample}:00", "%d/%m/%y %H:%M")
  end_time = start_time + ((rand(1..3)/24.0)) #.hours ?
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
    skip_geocoding: true,
    band: band
    )

  concert.save!
  puts "Concert n°#{concert.id} saved!"
end

total_time = Time.now - start_seed_time

puts "Geocoded seeds done in #{total_time}s"


# Add test account

test_account = User.new(
    first_name: "Test",
    last_name: "McTesty",
    email: "test@gmail.com",
    password: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
test_account.save!

### Demo

# Créer de petits clusters du genre choisi pour le groupe => Country
# Morlaix, Douarnenez, Concarneau
start_seed_time = Time.now
# Morlaix
counter = 1
110.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Morlaix",
    latitude: 48.5776,
    longitude: -3.8282,
    move_radius: rand(1..30),
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Morlaix user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

#Dournenez
counter = 1
87.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Douarnenez",
    latitude: 48.0932,
    longitude: -4.3286,
    move_radius: rand(1..30),
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Douarnenez user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

#Concarneau
counter = 1
79.times do
  last_name = GlobalConstants::FAMILY_NAMES.sample
  prefix = rand(0..10000).to_s
  suffix = rand(0..10000).to_s
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: last_name,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Concarneau",
    latitude: 47.8728,
    longitude: -3.9207,
    move_radius: rand(1..30),
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Concarneau user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

total_time = Time.now - start_seed_time

puts "Three clusters done in #{total_time}"
# Create the Demo users (Paul who has the band, Jerome who's a spectator)

paul = User.new(
    first_name: "Paul",
    last_name: "Fourchon",
    email: "fourchon@gmail.com",
    password: "lolilol",
    location: "Landéda",
    latitude: 48.5870,
    longitude: -4.5723,
    move_radius: rand(1..30),
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )

paul.save!

jerome = User.new(
    first_name: "Jérôme",
    last_name: "Luce",
    email: "luce@gmail.com",
    password: "lolilol",
    location: "Morlaix",
    latitude: 48.5776,
    longitude: -3.8282,
    move_radius: rand(1..30),
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )

jerome.save

# Create Demo band

zombie_rednecks = Band.new(
    name: "The Zombie Rednecks",
    genre: "Country",
    description: "Yeeehaw ! Les Zombie Rednecks, c'est notre nouveau projet Country. On prévoit de ramener l'amérique profonde dans la bretagne profonde !",
    external_link: "zombierednecks.bandcamp.com"
  )
zombie_rednecks.user = paul
zombie_rednecks.save!

# Créer des concerts passés et futurs

# Landeda (Hometown)
start_time = DateTime.strptime("06/03/20 20:00", "%d/%m/%y %H:%M")
end_time = start_time + (3/24.0)
concert_landeda = Concert.new(
  title: "#{zombie_rednecks.name} + Lonely but Together + The Crop Circlers - Bar Les Embruns",
  address: "180 route de doenna, Landéda",
  description: "Première date chez nous en bonne compagnie puisque nous retrouvons nos potes de Lonely but Together et un tout nouveau groupe local The Crop Circlers.",
  external_link: "facebook.com/event/zombie_rednecks43",
  price_cents: 1200,
  confirmed: true,
  start_time: start_time,
  end_time: end_time,
  )
concert_landeda.band = zombie_rednecks
concert_landeda.save!

# Brest (Random choice)
start_time = DateTime.strptime("23/04/20 23:00", "%d/%m/%y %H:%M")
end_time = start_time + (1/24.0)
concert_brest = Concert.new(
  title: "#{zombie_rednecks.name} - Discothèque Baroombar",
  address: "22 bis rue de Lyon, Brest",
  description: "Venez vous enjailler avec nous à Brest ce week-end !",
  external_link: "facebook.com/event/zombie_rednecks46",
  price_cents: 500,
  confirmed: true,
  start_time: start_time,
  end_time: end_time,
  )
concert_brest.band = zombie_rednecks
concert_brest.save!

# Concarneau (Actual Country cluster)
start_time = DateTime.strptime("21/03/20 20:00", "%d/%m/%y %H:%M")
end_time = start_time + (3/24.0)
concert_concarneau = Concert.new(
  title: "#{zombie_rednecks.name} + Babayou - La Taverne des Korrigans",
  address: "2 avenue du Dr Pierre Nicolas, Concarneau",
  description: "Concarneau, on arrive ! Babayou nous invite sur ses terres pour une soirée qui s'annonce mythique.",
  external_link: "facebook.com/event/zombie_rednecks53",
  price_cents: 1500,
  confirmed: true,
  start_time: start_time,
  end_time: end_time,
  )
concert_concarneau.band = zombie_rednecks
concert_concarneau.save!
