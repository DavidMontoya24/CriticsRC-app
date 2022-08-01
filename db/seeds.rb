puts "Destroying all data"
puts "Start seeding"
Critic.destroy_all
Company.destroy_all
Platform.destroy_all
Genre.destroy_all
Game.destroy_all
InvolvedCompany.destroy_all
puts "--------------------------"
puts "Start seeding data"

genres_data = [
  "Platform",
  "Hack and slash/Beat 'em up",
  "Adventure",
  "Role-playing (RPG)",
  "Shooter",
  "Simulator",
  "Racing",
  "Sport",
  "Puzzle",
  "Turn-based strategy (TBS)",
  "Indie"
]
genres_data.each do |genre|
  Genre.create(name: genre)
end

platform_data = [
  {
    category: 0,
    name: "Wii"
  },
  {
    category: 0,
    name: "Super Nintendo Entertainment System (SNES)"
  },
  {
    category: 0,
    name: "Wii U"
  },
  {
    category: 0,
    name: "Nintendo Switch"
  },
  {
    category: 4,
    name: "New Nintendo 3DS"
  },
  {
    category: 0,
    name: "PlayStation 4"
  },
  {
    category: 4,
    name: "Game Boy Advance"
  },
  {
    category: 2,
    name: "Virtual Console (Nintendo)"
  },
  {
    category: 0,
    name: "Super Famicom"
  },
  {
    category: 0,
    name: "PlayStation 3"
  },
  {
    category: 3,
    name: "PC (Microsoft Windows)"
  },
  {
    category: 0,
    name: "Xbox 360"
  },
  {
    category: 0,
    name: "Xbox One"
  },
  {
    category: 2,
    name: "Google Stadia"
  },
  {
    category: 0,
    name: "PlayStation"
  },
  {
    category: 4,
    name: "Nintendo DS"
  },
  {
    category: 3,
    name: "Android"
  },
  {
    category: 3,
    name: "iOS"
  },
  {
    category: 0,
    name: "Nintendo 64"
  },
  {
    category: 0,
    name: "Nintendo GameCube"
  },
  {
    category: 0,
    name: "Xbox"
  },
  {
    category: 3,
    name: "Mac"
  },
  {
    category: 3,
    name: "Linux"
  },
  {
    category: 4,
    name: "PlayStation Vita"
  },
  {
    category: 0,
    name: "PlayStation 2"
  },
  {
    category: 2,
    name: "Xbox Live Arcade"
  },
  {
    category: 2,
    name: "PlayStation Network"
  }
]

platform_data.each do |platform|
  Platform.create(name: platform[:name], category: platform[:category])
end
puts "--------------------------"
puts "Seeding test"
user1 = User.create(username: "Bob", role: 1, email: "test@mail.com", password: "123456")
admin1 = User.create(username: "Admin", role: 0, email: "admin@mail.com", password: "123456")
game1 = Game.create(name: "Super Mario World",
                    summary: "A 2D platformer and first entry on the SNES in the Super Mario franchise, Super Mario World follows Mario as he attempts to defeat Bowser's underlings and rescue Princess Peach from his clutches. The game features a save system, a less linear world map, an expanded movement arsenal and numerous new items for Mario, alongside new approaches to level design and art direction.",
                    release_date: "1990-11-21",
                    category: 0,
                    rating: 96.4,
                    parent: nil
                    )
game1.cover.attach(io: File.open("app/assets/images/game-covers/super-mario-world.png"), filename: "super-mario-world.png")


game2 = Game.create(name: "God of War",
                    summary: "It is a new beginning for Kratos. Living as a man, outside the shadow of the gods, he seeks solitude in the unfamiliar lands of Norse mythology. With new purpose and his son at his side, Kratos must fight for survival as powerful forces threaten to disrupt the new life he has created...",
                    release_date: "2018-04-20",
                    category: 0,
                    rating: 96.2,
                    
                    parent: nil
                    )
game2.cover.attach(io: File.open("app/assets/images/game-covers/God_of_War_4_cover.jpg"), filename: "God_of_War_4_cover.jpg")


company1 = Company.create(name: "Nintendo",
                          description: "Nintendo Co., Ltd. is a multinational corporation located in Kyoto, Japan. Founded on September 23, 1889 by Fusajiro Yamauchi, it produced handmade hanafuda cards. By 1963, the company had tried several small niche businesses, such as a cab company and a love hotel. Nintendo developed into a video game company, becoming one of the most influential in the industry and Japan's third most valuable listed company, with a market value of over US$85 billion. Besides video games, Nintendo is also the majority owner of the Seattle Mariners, a Major League Baseball team in Seattle, Washington. According to Nintendo's Touch! Generations website, the name Nintendo translated from Japanese to English means Leave luck to Heaven.",
                          country: "Japan",
                          start_date: "1976-09-23")

company2 = Company.create(name: "Nintendo EAD",
                          description: "Nintendo Entertainment Analysis & Development or Nintendo EAD, formerly Nintendo Research & Development 4, or Nintendo R&D4, was the largest division inside Nintendo until it merged with Nintendo Software Planning & Development in September 2015, becoming Nintendo Entertainment Planning & Development. It was preceded by the Creative Department (クリエイティブ課 Kurieitibu Ka?), a team of designers with backgrounds in art responsible for many different tasks, to which Shigeru Miyamoto and Takashi Tezuka originally belonged. Both served as managers of the EAD studios and were credited in every game developed by the division, with varying degrees of involvement. Nintendo EAD was best known for its work on games in the Donkey Kong, Mario, The Legend of Zelda, F-Zero, Star Fox, Pikmin, and Animal Crossing series.",
                          country: "Japan",
                          start_date: "1980-12-31")

company3 = Company.create(name: "Activision",
                          description: "Activision Publishing, Inc. is an American video game publisher based in Santa Monica, California. It serves as the publishing business for its parent company, Activision Blizzard, and consists of several subsidiary studios. Activision is one of the largest third-party video game publishers in the world and was the top United States publisher in 2016",
                          country: "United States",
                          start_date: "1979-10-01")

company4 = Company.create(name: "Sony Interactive Entertainment",
                            description: "Sony Interactive Entertainment (SIE), formerly known as Sony Computer Entertainment (SCE), is a multinational video game and digital entertainment company wholly owned by Japanese multinational conglomerate Sony.",
                            country: "Japan",
                            start_date: "1993-11-16")

company1.cover.attach(io: File.open("app/assets/images/companies/nintendo.png"), filename: "nintendo-cover.png")
company2.cover.attach(io: File.open("app/assets/images/companies/nintendo.png"), filename: "nintendo-cover.png")
company3.cover.attach(io: File.open("app/assets/images/companies/activision.png"), filename: "activision.png")
company4.cover.attach(io: File.open("app/assets/images/companies/sony.png"), filename: "sony.png")

puts "--------------------------"
puts "Finished seeding data"
