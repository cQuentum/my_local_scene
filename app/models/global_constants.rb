module GlobalConstants
  GENRES = ["Rock", "Metal", "Rap", "RnB", "Classique", "Jazz", "Hip-Hop", "Country", "Blues", "Electronique", "Folk", "Pop",
"Funk", "Soul", "Reggae", "Ambient", "Ska", "Contemporaine", "Dance"]
  GENRES_BREST = GENRES
  GENRES_BREST.delete("Metal")
  GENRES_QUIMPER = GENRES
  GENRES_QUIMPER.delete("Rap")
  GENRES_CARHAIX = GENRES
  GENRES_CARHAIX.delete("Rock")
  GENRES_DEMO = GENRES
  GENRES_DEMO.delete("Country")
  FAMILY_NAMES = ["Martin", "Bernard", "Thomas", "Petit", "Robert", "Durand", "Dubois", "Moreau", "Lefebvre", "Leroy", "Morel", "Fournier", "Girard", "Bonnet", "Fontaine", "Le Cam", "Le Bail", "Drezen", "Lecoq"]
  FIRST_NAMES = ["Jean", "Pierre", "Michel", "André", "Philippe", "René", "Louis", "Alain", "Jacques", "Bernard", "Marcel", "Daniel", "Roger", "Robert", "Paul", "Claude", "Christian", "Henri", "Georges", "Nicolas", "François", "Patrick"]
end
