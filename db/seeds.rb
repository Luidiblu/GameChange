
system 'clear'
puts "Seed Start"

def separate
  puts "\n" + "="*100 + "\n\n"
end

def record_new(instance)
  if instance.save
    puts "--- #{instance.name} was created!"
  else
    puts "=========================== Something went wrong =========================="
    puts "=================== #{instance.errors.messages} ==================="
  end
end

separate

puts "Cleaning database\n\n"

Game.destroy_all
puts "#{Game.count} games!"

User.destroy_all
puts "#{User.count} users!"

Lobby.destroy_all
puts "#{Lobby.count} lobbies!"

Session.destroy_all
puts "#{Session.count} sessions!"

separate

puts "Generating Games:\n\n"

mine = Game.new(
  name: "Minecraft",
  photo: "https://www.mobygames.com/images/covers/l/489736-minecraft-windows-apps-front-cover.jpg",
  banner: "https://images.alphacoders.com/246/thumb-1920-246223.jpg"
)
record_new(mine)

lol = Game.new(
  name: "League of Legends",
  photo: "https://news-a.akamaihd.net/public/images/misc/GameBox.jpg",
  banner: "http://www.fullhdwpp.com/wp-content/uploads/League_of_Legends_brushed_logo_www.FullHDWpp.com_.jpg"
)
record_new(lol)

gta = Game.new(
  name: "Grand Theft Auto V",
  photo: "https://s3.gaming-cdn.com/images/products/4211/orig/grand-theft-auto-v-premium-online-edition-cover.jpg",
  banner: "https://i.imgur.com/XnLkFVa.jpg"
)
record_new(gta)

ass = Game.new(
  name: 'Assassins Creed III',
  photo: 'https://http2.mlstatic.com/assassins-creed-iii-remastered-midia-fisica-pc-dvd-D_NQ_NP_998247-MLB29758883631_032019-F.jpg',
  banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(ass)

separate

puts "Generating Users:\n\n"

carlos = User.new(
  name: "Carlao pinta grossa",
  nickname: "MIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU",
  email: "carlos@romero.com",
  password: "123123"
)
record_new(carlos)

admin = User.new(
  name: "Diego",
  nickname: "Sir ChangesALot of the Front End",
  email: "a@a",
  password: "thanos",
  admin: true
)
record_new(admin)

User.all.each { |ad| next unless ad.admin; puts "\n --- #{ad.name} is a site Admin!"}

separate

puts "\nEnded!\n\n"
puts '⣿⣿⣿⣿⣿⡏⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿
⣿⣿⣿⣿⣿⣿⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⣿
⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠙⠿⠿⠿⠻⠿⠿⠟⠿⠛⠉⠀⠀⠀⠀⠀⣸⣿
⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⢰⣹⡆⠀⠀⠀⠀⠀⠀⣭⣷⠀⠀⠀⠸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠈⠉⠀⠀⠤⠄⠀⠀⠀⠉⠁⠀⠀⠀⠀⢿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⢾⣿⣷⠀⠀⠀⠀⡠⠤⢄⠀⠀⠀⠠⣿⣿⣷⠀⢸⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡀⠉⠀⠀⠀⠀⠀⢄⠀⢀⠀⠀⠀⠀⠉⠉⠁⠀⠀⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿'
