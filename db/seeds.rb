require 'faker'

start_seed_time = Time.now


#Seeding Brest
counter = 1
22.times do
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
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Brest user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
30.times do
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
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Quimper user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
12.times do
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
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Carhaix user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

total_time = Time.now - start_seed_time

puts "Total users created : #{User.count}"
puts "Fixed seeds done in #{total_time}s"






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
    genres: ["Metal"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
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
start_time = DateTime.strptime("08/05/20 20:00", "%d/%m/%y %H:%M")
end_time = start_time + (3/24.0)
concert_landeda = Concert.new(
  title: "#{zombie_rednecks.name} + Lonely but Together + The Crop Circlers - Bar Les Embruns",
  address: "180 route de doenna, Landéda",
  description: "Retour sur nos terres en bonne compagnie puisque nous retrouvons nos potes de Lonely but Together et un tout nouveau groupe local The Crop Circlers.",
  external_link: "facebook.com/event/zombie_rednecks43",
  price_cents: 1200,
  confirmed: true,
  start_time: start_time,
  end_time: end_time,
  )
concert_landeda.band = zombie_rednecks
concert_landeda.save!

# Brest (Random choice)
start_time = DateTime.strptime("16/04/20 23:00", "%d/%m/%y %H:%M")
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

