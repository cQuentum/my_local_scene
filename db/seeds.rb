require 'faker'
require 'open-uri'

# Create the Demo users (Paul who has the band, Jerome who's a spectator)
puts "Destroying old db"
Participation.destroy_all
Concert.destroy_all
Band.destroy_all
User.destroy_all
puts "Old db destroyed"

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
file = URI.open('https://pbs.twimg.com/profile_images/1229445805700009986/jW1ys0x7_400x400.jpg')
paul.photo.attach(io: file, filename: 'paul.jpg', content_type: 'image/jpg')
paul.save!

jerome = User.new(
    first_name: "Jérôme",
    last_name: "Luce",
    email: "luce@gmail.com",
    password: "lolilol",
    location: "Morlaix",
    latitude: 48.5824932,
    longitude: -3.8331972,
    move_radius: rand(1..30),
    genres: ["Metal","Jazz"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )

file = URI.open('https://i.ibb.co/ns2MZwy/jeromepp.jpg')
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
puts "Fixed seeds done in #{total_time} seconds"





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
    latitude: 48.5824932,
    longitude: -3.8331972,
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
    latitude: 48.5824932,
    longitude: -3.8331972,
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

rock_user3 = User.new(
    first_name: "Jack",
    last_name: "Mauvais",
    email: "mauvais@gmail.com",
    password: "lolilol",
    location: "Rennes",
    latitude: 48.1113387,
    longitude: -1.6800198,
    move_radius: rand(1..30),
    genres: ["Metal"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
rock_user3.save!

jazz_user1 = User.new(
    first_name: "Louis",
    last_name: "Armsweak",
    email: "armsweak@gmail.com",
    password: "lolilol",
    location: "Brest",
    latitude: 48.3905283,
    longitude: -4.4860088,
    move_radius: rand(1..30),
    genres: ["Jazz"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
jazz_user1.save!

jazz_user2 = User.new(
    first_name: "Andrée",
    last_name: "Maillet",
    email: "maillet@gmail.com",
    password: "lolilol",
    location: "Rennes",
    latitude: 48.1113387,
    longitude: -1.6800198,
    move_radius: rand(1..30),
    genres: ["Jazz"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
jazz_user2.save!

jazz_user69 = User.new(
    first_name: "Pedro",
    last_name: "Universidad",
    email: "universidadpedrolane@gmail.com",
    password: "lolilol",
    location: "Rennes",
    latitude: 48.1113387,
    longitude: -1.6800198,
    move_radius: rand(1..30),
    genres: ["Jazz"].push(GlobalConstants::GENRES_BREST.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
jazz_user69.save!

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
file = URI.open('https://i.ibb.co/fQyWk80/wurm.jpg')
wurm.photo.attach(io: file, filename: 'wurm.jpg', content_type: 'image/jpg')
wurm.save!

twllaw = Band.new(
    name: "TWLLAW",
    genre: "Metal",
    description: "Avec un premier EP Endless Vortex Experiment sortie en 2015, This Wave Looks Like a Wolf revient avec un nouvel album sous son bras ailé ! Car oui cette vague aérienne qui surgirait dans un ciel assombrit métaphore d'un avenir bien peu reluisant se vit en Live comme un ultime voyage poétique et puissant. Et quand la vague prend de l’ampleur c’est pour mieux nous transporter jusqu’à nous submerger dans un tourbillon sonore dans lequel le trio guitare/basse/batterie se fait incontrôlable.",
    external_link: "thiswavelookslikeawolf.bandcamp.com"
  )
twllaw.user = rock_user2
file = URI.open('https://i.ibb.co/rsgvM7D/twllaw.jpg')
twllaw.photo.attach(io: file, filename: 'twllaw.jpg', content_type: 'image/jpg')
twllaw.save!

chainsawsoul = Band.new(
    name: "Chainsaw Soul",
    genre: "Metal",
    description: "Grands explorateurs de sous genres de cet art noble qu'est le Metal, nous sommes enfin de retour avec une formation de Neo Trash Metal Celtique, et ça envoie du gros Menhir.",
    external_link: "chainsawsoul.bandcamp.com"
  )
chainsawsoul.user = rock_user3
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//200424115736347428.jpg')
chainsawsoul.photo.attach(io: file, filename: '200424115736347428.jpg', content_type: 'image/jpg')
chainsawsoul.save!

thejazzygoblins = Band.new(
    name: "The Jazzy Goblins",
    genre: "Jazz",
    description: "Notre jazz est vif, douloureux, doux, tendre, lent ; il apaise, il bouleverse, c'est de la musique et ce qu'il rythme est vrai, c'est le pouls de la vie.",
    external_link: "jazzygoblins.bandcamp.com"
  )
thejazzygoblins.user = jazz_user1
file = URI.open('https://nsa40.casimages.com/img/2020/04/23//200423104920239755.jpg')
thejazzygoblins.photo.attach(io: file, filename: '200423104920239755.jpg', content_type: 'image/jpg')
thejazzygoblins.save!

theloveoflads = Band.new(
    name: "The Love Of Lads",
    genre: "Jazz",
    description: "Quatre musiciens, un répertoire original, des compos qui sentent l'évasion, le swing, la spontanéité d'un concert improvisé dans le fin fond d'une roulotte.",
    external_link: "theloveoflads.bandcamp.com"
  )
theloveoflads.user = jazz_user2
file = URI.open('https://nsa40.casimages.com/img/2020/04/23//200423120515114057.jpg')
theloveoflads.photo.attach(io: file, filename: '200423120515114057.jpg', content_type: 'image/jpg')
theloveoflads.save!

fredapache = Band.new(
    name: "Fredapache",
    genre: "Jazz",
    description: "Un peu d'Acid Jazz, beaucoup de culture, et une petite voix qui te rendra fou ! Un jour, peut-être qu'on chauffera Marseille !",
    external_link: "fredapache.bandcamp.com"
  )
fredapache.user = jazz_user69
file = URI.open('https://i.ibb.co/G0w9ZH3/Madrid-Acid-Jazz-Band-2.jpg')
fredapache.photo.attach(io: file, filename: 'fredapache.jpg', content_type: 'image/jpg')
fredapache.save!

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
  price_cents: 500,
  confirmed: true,
  start_time: start_time
  )
concert_metal_3.band = wurm
file = URI.open('https://i.ibb.co/Jk04rvB/wurmaffiche.jpg')
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
file = URI.open('https://i.ibb.co/dpzBj0z/twllawaffiche.jpg')
concert_metal_4.photo.attach(io: file, filename: 'twllawaffiche.jpg', content_type: 'image/jpg')
concert_metal_4.save!

start_time = DateTime.strptime("29/06/20 21:00", "%d/%m/%y %H:%M")
concert_metal_5 = Concert.new(
  title: "#{wurm.name} - Tempo",
  address: "Cours Beaumont, Morlaix",
  description: "Notre premier concert solo au Tempo.",
  external_link: "facebook.com/event/wurm69nicelmao",
  price_cents: 500,
  confirmed: true,
  start_time: start_time
  )
concert_metal_5.band = wurm
file = URI.open('https://nsa40.casimages.com/img/2020/04/23//200423035507711556.jpg')
concert_metal_5.photo.attach(io: file, filename: '200423035507711556.jpg', content_type: 'image/jpg')
concert_metal_5.save!

start_time = DateTime.strptime("07/05/20 20:00", "%d/%m/%y %H:%M")
concert_metal_6 = Concert.new(
  title: "#{chainsawsoul.name} - Mondo Bizarro",
  address: "Avenue de Rochester, Rennes",
  description: "De retour sur notre scène favorite pour un set de trois heure, fans de Neo Trash Metal Celtique, on vous attend !",
  external_link: "facebook.com/event/69chainsaw69",
  price_cents: 900,
  confirmed: true,
  start_time: start_time
  )
concert_metal_6.band = chainsawsoul
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//20042412073092482.jpg')
concert_metal_6.photo.attach(io: file, filename: '20042412073092482.jpg', content_type: 'image/jpg')
concert_metal_6.save!


start_time = DateTime.strptime("26/06/20 21:00", "%d/%m/%y %H:%M")
concert_jazz_1 = Concert.new(
  title: "#{thejazzygoblins.name} - Greenwich Café",
  address: "5 boulevard des français libres, Brest",
  description: "Notre premier concert solo au greenwich café.",
  external_link: "facebook.com/event/jazzygoblins29",
  price_cents: 1300,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_1.band = thejazzygoblins
file = URI.open('https://i.ibb.co/xCX49ZB/The-Jazzy-Goblins.jpg')
concert_jazz_1.photo.attach(io: file, filename: 'The-Jazzy-Goblins.jpg', content_type: 'image/jpg')
concert_jazz_1.save!

start_time = DateTime.strptime("04/06/20 19:00", "%d/%m/%y %H:%M")
concert_jazz_2 = Concert.new(
  title: "#{theloveoflads.name} - Le Barado'Zic",
  address: "3 Rue de Siam, Brest",
  description: "Premier concert sur Brest, venez nombreux !",
  external_link: "facebook.com/event/theloveoflads29",
  price_cents: 800,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_2.band = theloveoflads
file = URI.open('https://nsa40.casimages.com/img/2020/04/23//200423114756556919.jpg')
concert_jazz_2.photo.attach(io: file, filename: '200423114756556919.jpg', content_type: 'image/jpg')
concert_jazz_2.save!

start_time = DateTime.strptime("21/06/20 19:00", "%d/%m/%y %H:%M")
concert_jazz_3 = Concert.new(
  title: "#{theloveoflads.name} - Pub En Selle",
  address: "55 rue haute, Morlaix",
  description: "Premier concert sur Morlaix, venez nombreux !",
  external_link: "facebook.com/event/theloveoflads29",
  price_cents: 800,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_3.band = theloveoflads
file = URI.open('https://nsa40.casimages.com/img/2020/04/23/200423032616277216.jpg')
concert_jazz_3.photo.attach(io: file, filename: '200423032616277216.jpg', content_type: 'image/jpg')
concert_jazz_3.save!

start_time = DateTime.strptime("28/06/20 21:00", "%d/%m/%y %H:%M")
concert_jazz_4 = Concert.new(
  title: "#{thejazzygoblins.name} - Ty Coz",
  address: "10 Venelle Beurre, Morlaix",
  description: "Notre premier concert solo au Ty Coz.",
  external_link: "facebook.com/event/jazzygoblins29",
  price_cents: 1300,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_4.band = thejazzygoblins
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//200424123540660942.jpg')
concert_jazz_4.photo.attach(io: file, filename: '200424123540660942.jpg', content_type: 'image/jpg')
concert_jazz_4.save!

start_time = DateTime.strptime("20/06/20 21:00", "%d/%m/%y %H:%M")
concert_jazz_5 = Concert.new(
  title: "#{thejazzygoblins.name} - Penny Lane",
  address: "1 Rue de Coetquen, Rennes",
  description: "Notre premier concert solo au Penny Lane.",
  external_link: "facebook.com/event/jazzygoblins29",
  price_cents: 1000,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_5.band = thejazzygoblins
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//200424100538398897.jpg')
concert_jazz_5.photo.attach(io: file, filename: '200424100538398897.jpg', content_type: 'image/jpg')
concert_jazz_5.save!

start_time = DateTime.strptime("27/06/20 20:00", "%d/%m/%y %H:%M")
concert_jazz_6 = Concert.new(
  title: "#{theloveoflads.name} - Ty Anna Tavarn",
  address: "19 Place Sainte-Anne, Rennes",
  description: "Notre premier concert solo au Ty Anna Tavarn.",
  external_link: "facebook.com/event/theloveoflads29",
  price_cents: 1500,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_6.band = theloveoflads
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//200424101821670623.jpg')
concert_jazz_6.photo.attach(io: file, filename: '200424101821670623.jpg', content_type: 'image/jpg')
concert_jazz_6.save!

start_time = DateTime.strptime("17/06/20 20:00", "%d/%m/%y %H:%M")
concert_jazz_7 = Concert.new(
  title: "#{theloveoflads.name} - LE POURQUOI PAS",
  address: "15 Quai du Port Rhu, Douarnenez",
  description: "Notre premier concert solo à Douarnenez.",
  external_link: "facebook.com/event/theloveoflads29",
  price_cents: 1100,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_7.band = theloveoflads
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//200424110532793993.jpg')
concert_jazz_7.photo.attach(io: file, filename: '200424110532793993.jpg', content_type: 'image/jpg')
concert_jazz_7.save!

start_time = DateTime.strptime("13/06/20 21:00", "%d/%m/%y %H:%M")
concert_jazz_8 = Concert.new(
  title: "#{thejazzygoblins.name} - La Taverne des Korrigans",
  address: "2 Avenue du Dr Pierre Nicolas, Concarneau",
  description: "Notre premier concert solo à Concarneau.",
  external_link: "facebook.com/event/jazzygoblins29",
  price_cents: 800,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_8.band = thejazzygoblins
file = URI.open('https://nsa40.casimages.com/img/2020/04/24//200424112229424666.jpg')
concert_jazz_8.photo.attach(io: file, filename: '200424112229424666.jpg', content_type: 'image/jpg')
concert_jazz_8.save!

start_time = DateTime.strptime("23/05/20 22:00", "%d/%m/%y %H:%M")
concert_jazz_69 = Concert.new(
  title: "#{fredapache.name} - Synthi",
  address: "2 rue de Chateaudun, Rennes",
  description: "Nous sommes ravis de venir jouer dans un des meilleurs bars communistes de Rennes ! Venez nous retrouver, et bien entendu, l'entrée est au tarif habituel d'un euro symbolique !",
  external_link: "facebook.com/event/fredapache420",
  price_cents: 100,
  confirmed: true,
  start_time: start_time
  )
concert_jazz_69.band = fredapache
file = URI.open('https://i.ibb.co/FKX9cnd/fredapache.jpg')
concert_jazz_69.photo.attach(io: file, filename: 'fredapacheconcert.jpg', content_type: 'image/jpg')
concert_jazz_69.save!

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
    latitude: 48.5824932,
    longitude: -3.8331972,
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
    latitude: 48.5824932,
    longitude: -3.8331972,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Morlaix user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

counter = 1
37.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Carantec",
    latitude: 48.668359,
    longitude: -3.9142802,
    move_radius: rand(1..30),
    genres: ["Country"].push(GlobalConstants::GENRES_DEMO.sample(rand(1..2))).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Carantec user #{counter} saved. Genres : #{user.genres}"
  counter += 1
end

16.times do
  user = User.new(
    first_name: GlobalConstants::FIRST_NAMES.sample,
    last_name: GlobalConstants::FAMILY_NAMES.sample,
    email: Faker::Internet.unique.email,
    password: "lolilol",
    location: "Carantec",
    latitude: 48.668359,
    longitude: -3.9142802,
    move_radius: rand(1..30),
    genres: GlobalConstants::GENRES.sample(rand(1..3)).flatten,
    skip_geocoding: true
  )
  user.save!
  puts "Carantec user #{counter} saved. Genres : #{user.genres}"
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
    latitude: 48.0944459,
    longitude: -4.3311243,
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
    latitude: 48.0944459,
    longitude: -4.3311243,
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
    latitude: 47.8757017,
    longitude: -3.9223889,
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
    latitude: 47.8757017,
    longitude: -3.9223889,
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
landeda_id = concert_landeda.id

# Other concert, a little more popular

counter = User.first.id.to_i + 2
13.times do
  participation = Participation.new(
    user: User.find(counter),
    concert: Concert.find(landeda_id)
    )
  participation.save!
  counter += 1
end
