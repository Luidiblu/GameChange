
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

lol = Game.new(
  name: "League of Legends",
  photo: "https://logodownload.org/wp-content/uploads/2014/09/lol-logo-league-of-legends.png"
)
record_new(lol)

mine = Game.new(
  name: "Minecraft",
  photo: "https://www.mobygames.com/images/covers/l/489736-minecraft-windows-apps-front-cover.jpg"
)
record_new(mine)

gta = Game.new(
  name: "Grand Theft Auto V",
  photo: "https://s3.gaming-cdn.com/images/products/4211/orig/grand-theft-auto-v-premium-online-edition-cover.jpg"
)
record_new(gta)

ass = Game.new(
  name: 'Assassins Creed III Remastered',
  photo: 'https://assets1.ignimgs.com/2019/03/27/ac3remastered-blogroll-1553726660766_160w.jpg?fit=bounds&amp;dpr=1&amp;quality=75&amp;crop=16%3A9&amp;width=300&amp;format=pjpg'
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
  password: "thanos"
)
record_new(admin)

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
