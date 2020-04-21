require 'faker'
require 'open-uri'




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
file = URI.open('https://avatars3.githubusercontent.com/u/58589677?s=400&u=d0578c7956266113b6a2118fffe2a573e7d19c4c&v=4')
paul.photo.attach(io: file, filename: 'paul.jpg', content_type: 'image/jpg')
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

file = URI.open('https://avatars2.githubusercontent.com/u/49526754?v=4')
jerome.photo.attach(io: file, filename: 'jerome.jpg', content_type: 'image/jpg')
jerome.save!


start_seed_time = Time.now


#Seeding Brest
counter = 1
22.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
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

80.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Brest user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
30.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
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

40.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Quimper",
    latitude: 47.9960325,
    longitude: -4.1024782,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Quimper user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
12.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
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

34.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Carhaix",
    latitude: 48.2779589,
    longitude: -3.5620953,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
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

metal_user1 = User.new(
    first_name: "Pierre",
    last_name: "Facq",
    email: "facq@gmail.com",
    password: "lolilol",
    location: "Morlaix",
    latitude: 48.5776,
    longitude: -3.8282,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
metal_user1.save!

metal_user2 = User.new(
    first_name: "Hugo",
    last_name: "Daniel",
    email: "daniel@gmail.com",
    password: "lolilol",
    location: "Morlaix",
    latitude: 48.5776,
    longitude: -3.8282,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
metal_user2.save!

rock_user1 = User.new(
    first_name: "Pierre Loup",
    last_name: "Le Mouel",
    email: "lemouel@gmail.com",
    password: "lolilol",
    location: "Rennes",
    latitude: 48.1113387,
    longitude: -1.6800198,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
rock_user1.save!

rock_user2 = User.new(
    first_name: "Kevin",
    last_name: "Brosse",
    email: "brosse@gmail.com",
    password: "lolilol",
    location: "Rennes",
    latitude: 48.1113387,
    longitude: -1.6800198,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
rock_user2.save!


#Fake metal bands & concerts

no_one_is_in_auchan = Band.new(
    name: "No one is in Auchan",
    genre: "Metal",
    description: "Groupe de Metal Sludge basé à Morlaix. Avez vous déjà rêvé d'être dans un magasin seul la nuit ? Musicalement, nous, c'est ça. On s'inspire principalement de Earth, Novolic et autres groupes du genre.",
    external_link: "nooneisinauchan.bandcamp.com"
  )
no_one_is_in_auchan.user = metal_user1
file = URI.open('https://i.ibb.co/18T1wWZ/nooneisinauchan.jpg')
no_one_is_in_auchan.photo.attach(io: file, filename: 'noiia.jpg', content_type: 'image/jpg')
no_one_is_in_auchan.save!

fetus_eater = Band.new(
    name: "Fetus Eater",
    genre: "Metal",
    description: "Du bon gros grindcore des familles ! Dans la lignée directe des groupes fondateurs comme Vaginal Cassoulet ou Gronibard.",
    external_link: "fetuseater.bandcamp.com"
  )
fetus_eater.user = metal_user2
file = URI.open('https://i.ibb.co/t4W0kLr/fetuseater.jpg')
fetus_eater.photo.attach(io: file, filename: 'feteat.jpg', content_type: 'image/jpg')
fetus_eater.save!

wurm = Band.new(
    name: "Wurm",
    genre: "Metal",
    description: "Le quatuor instrumental de Frost-rock propose un voyage en terres glaciales, peuplée de Mammouth. Du Drone au Post-Rock en passant par le Metal, viens te réchauffer devant les amplis glacés.",
    external_link: "wurm.bandcamp.com"
  )
wurm.user = rock_user1
file = URI.open('https://ibb.co/7bZDngy')
wurm.photo.attach(io: file, filename: 'wurm.jpg', content_type: 'image/jpg')
wurm.save!

twllaw = Band.new(
    name: "This Wave Looks Like A Wolf",
    genre: "Metal",
    description: "Avec un premier EP Endless Vortex Experiment sortie en 2015, TWLLAW nous revient avec un nouvel album sous leur bras ailé ! Car oui cette vague aérienne qui surgirait dans un ciel assombrit métaphore d'un avenir bien peu reluisant se vit en Live comme un ultime voyage poétique et puissant. Et quand la vague prend de l’ampleur c’est pour mieux nous transporter jusqu’à nous submerger dans un tourbillon sonore dans lequel le trio guitare/basse/batterie se fait incontrôlable.",
    external_link: "thiswavelookslikeawolf.bandcamp.com"
  )
twllaw.user = rock_user2
file = URI.open('https://ibb.co/WtQsFxm')
twllaw.photo.attach(io: file, filename: 'twllaw.jpg', content_type: 'image/jpg')
twllaw.save!


# Concerts

start_time = DateTime.strptime("01/05/20 21:00", "%d/%m/%y %H:%M")
concert_metal_1 = Concert.new(
  title: "#{no_one_is_in_auchan.name} + Guests - Ty Coz",
  address: "10 Venelle Beurre, Morlaix",
  description: "Release party pour notre nouvel album Le Coronavirus Est Malade. Nous serons accompagnés d'un autre groupe surprise !",
  external_link: "facebook.com/event/nooneauchan4",
  price_cents: 1000,
  confirmed: true,
  start_time: start_time
  )
concert_metal_1.band = no_one_is_in_auchan
file = URI.open('https://i.ibb.co/yyRj4vf/NO-ONE-IS-IN-AUCHAN.jpg')
concert_metal_1.photo.attach(io: file, filename: 'concertnoiia.jpg', content_type: 'image/jpg')
concert_metal_1.save!


start_time = DateTime.strptime("25/04/20 21:00", "%d/%m/%y %H:%M")
concert_metal_2 = Concert.new(
  title: "#{fetus_eater.name} - Pub La Selle",
  address: "55 rue haute, Morlaix",
  description: "Premier concert en solo, nous prévoyons un set très long d'une demi heure, du jamais vu dans le monde du grindcore.",
  external_link: "facebook.com/event/feteat69",
  price_cents: 800,
  confirmed: true,
  start_time: start_time
  )
concert_metal_2.band = fetus_eater
file = URI.open('https://i.ibb.co/px8Q2bg/concert-fetus-eater.jpg')
concert_metal_2.photo.attach(io: file, filename: 'feteatconc.jpg', content_type: 'image/jpg')
concert_metal_2.save!

start_time = DateTime.strptime("15/05/20 21:00", "%d/%m/%y %H:%M")
concert_metal_3 = Concert.new(
  title: "#{wurm.name} + Mileck - Alex's Tavern",
  address: "10 rue Saint Michel, Rennes",
  description: "Concert à l'Alex's Tavern avec le groupe Mileck ! Venez fêter la fin du confinement en musique. Prix libre, bouchons d'oreille à disposition à l'entrée.",
  external_link: "facebook.com/event/wurm69nicelmao",
  price_cents: 0,
  confirmed: true,
  start_time: start_time
  )
concert_metal_3.band = wurm
file = URI.open('https://ibb.co/ysG1g6f')
concert_metal_3.photo.attach(io: file, filename: 'concertwurm.jpg', content_type: 'image/jpg')
concert_metal_3.save!

start_time = DateTime.strptime("09/05/20 21:00", "%d/%m/%y %H:%M")
concert_metal_4 = Concert.new(
  title: "#{twllaw.name} + Orso + Overstrange Mood - Mondo Bizarro",
  address: "Avenue de Rochester, Rennes",
  description: "Nous rejoignons à nouveau la scène du Mondo Bizarro en compagnie d'Orso, groupe de Post Hardcore Suisse et OSM, groupe de Metal Prog. Merci à Antisthène pour l'organisation.",
  external_link: "facebook.com/event/twllaw42bestanswerever",
  price_cents: 1200,
  confirmed: true,
  start_time: start_time
  )
concert_metal_4.band = twllaw
file = URI.open('https://ibb.co/VCPVJWP')
concert_metal_4.photo.attach(io: file, filename: 'twllaw.jpg', content_type: 'image/jpg')
concert_metal_4.save!


### Demo

# Créer de petits clusters du genre choisi pour le groupe => Country
# Morlaix, Douarnenez, Concarneau
start_seed_time = Time.now
puts "Creating bigger Country music clusters"
# Morlaix
counter = 1
110.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
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

60.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Morlaix",
    latitude: 48.5776,
    longitude: -3.8282,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Morlaix user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

#Dournenez
counter = 1
87.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
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

61.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Douarnenez",
    latitude: 48.0932,
    longitude: -4.3286,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Douarnenez user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

#Concarneau
counter = 1
79.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
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

counter = 1
46.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Concarneau",
    latitude: 47.8728,
    longitude: -3.9207,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Concarneau user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

total_time = Time.now - start_seed_time

puts "The three Country clusters were done in #{total_time}"

# Create Demo band
puts "Now creating Demo band and its concerts"

zombie_rednecks = Band.new(
    name: "The Zombie Rednecks",
    genre: "Country",
    description: "Yeeehaw ! Les Zombie Rednecks, c'est notre nouveau projet Country. On prévoit de ramener l'amérique profonde dans la bretagne profonde !",
    external_link: "zombierednecks.bandcamp.com"
  )
zombie_rednecks.user = paul
file = URI.open('https://i.ibb.co/hDLv38c/zombred.jpg')
zombie_rednecks.photo.attach(io: file, filename: 'zombred.jpg', content_type: 'image/jpg')
zombie_rednecks.save!
# Créer des concerts passés et futurs

# Landeda (Hometown)
start_time = DateTime.strptime("08/05/20 20:00", "%d/%m/%y %H:%M")
concert_landeda = Concert.new(
  title: "#{zombie_rednecks.name} + Lonely but Together + The Crop Circlers - Bar Les Embruns",
  address: "180 route de doenna, Landéda",
  description: "Retour sur nos terres en bonne compagnie puisque nous retrouvons nos potes de Lonely but Together et un tout nouveau groupe local The Crop Circlers.",
  external_link: "facebook.com/event/zombie_rednecks43",
  price_cents: 1200,
  confirmed: true,
  start_time: start_time
  )
concert_landeda.band = zombie_rednecks
file = URI.open('https://i.ibb.co/Yhph17C/landeda-concert.jpg')
concert_landeda.photo.attach(io: file, filename: 'landedaconc.jpg', content_type: 'image/jpg')
concert_landeda.save!

# Brest (Shitty concert from yesterday)
start_time = DateTime.strptime("16/04/20 23:00", "%d/%m/%y %H:%M")
concert_brest = Concert.new(
  title: "#{zombie_rednecks.name} - Discothèque Baroombar",
  address: "22 bis rue de Lyon, Brest",
  description: "Venez vous enjailler avec nous à Brest ce week-end ! C'est notre premier concert dans ce type d'établissement, on espère que ça va vous plaire !",
  external_link: "facebook.com/event/zombie_rednecks46",
  price_cents: 500,
  confirmed: true,
  start_time: start_time
  )
concert_brest.band = zombie_rednecks
file = URI.open('https://i.ibb.co/By2Z6km/brest-concert.jpg')
concert_brest.photo.attach(io: file, filename: 'brestconc.jpg', content_type: 'image/jpg')
concert_brest.save!


