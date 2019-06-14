
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

Session.destroy_all
puts "#{Session.count} sessions!"

Message.destroy_all
puts "#{Message.count} messages!"

Lobby.destroy_all
puts "#{Lobby.count} lobbies!"

User.destroy_all
puts "#{User.count} users!"

Game.destroy_all
puts "#{Game.count} games!"

separate

puts "Generating Games:\n\n"

mine = Game.new(
  name: "Minecraft",
  photo: "https://www.mobygames.com/images/covers/l/489736-minecraft-windows-apps-front-cover.jpg"
  # banner: "https://images.alphacoders.com/246/thumb-1920-246223.jpg"
)
record_new(mine)

lol = Game.new(
  name: "League of Legends",
  photo: "https://news-a.akamaihd.net/public/images/misc/GameBox.jpg"
  # banner: "http://www.fullhdwpp.com/wp-content/uploads/League_of_Legends_brushed_logo_www.FullHDWpp.com_.jpg"
)
record_new(lol)

terraria = Game.new(
  name: 'Terraria',
  photo: 'https://fsb.zobj.net/crop.php?r=M7LlzAXvAn5y_ybb_zZJtAXHRM-v4KNa4fmq2UuWBVf1jZPHzZToTiZS-EaA8EflBHD9uAUrewpwoGI7G2F40By3pHtpul33AsvUH61_sZYlWoy45jBl-uvfdsO25TFH2yzvhOyribowOQeu'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(terraria)

over = Game.new(
  name: 'Overwatch',
  photo: 'https://cdn.europosters.eu/image/750/posters/overwatch-tracer-i30793.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(over)

fort = Game.new(
  name: 'Fortnite',
  photo: 'https://fsa.zobj.net/crop.php?r=euTDnf_1glU4EFkNyAKTNiMtbrnyslya2zsmvuuIoiV_L4Pp8oilmQysRIkHs_O0rjb1F_2R-browmRzYfMboIIdj5retjf3pIQtKoUpXMsdDobO471rMpIKm1PPwHqzTJjlMTJHBzRMj9Vv'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(fort)

rocket = Game.new(
  name: 'Rocket League',
  photo: 'https://images-na.ssl-images-amazon.com/images/I/81mK3T9GkGL._AC_SL1500_.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(rocket)

apex = Game.new(
  name: 'Apex Legends',
  photo: 'https://media.playstation.com/is/image/SCEA/apex-legends-box-art-01-ps4-us-31jan19?$native_nt$'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(apex)

rainbow = Game.new(
  name: 'Rainbow Six Siege',
  photo: 'https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTco1m1k.boWuR3YBlK0wwWjvjutf4EhA9_oILPck_NXWCykYwADctQ.HYcyq7zYg.HZNhHLjuMl3g9dXDHOTFJ8p2hV31.imNSumwRUJJ0r6T.p6VMEXDDKvZMq7PLgPGa518DcN_JlPlItIM3Z0Y.bZtLB0JNwHAWGH.WFXB_z.w-'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(rainbow)

tf2 = Game.new(
  name: 'Team Fortress 2',
  photo: 'http://vgboxart.com/boxes/PC/12898-team-fortress-2-full.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(tf2)

dota = Game.new(
  name: 'DOTA 2',
  photo: 'https://http2.mlstatic.com/codigo-mestre-dota-2-libera-todos-os-itens-D_NQ_NP_910546-MLB30214116102_052019-F.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(dota)

hearthstone = Game.new(
  name: 'Hearthstone',
  photo: 'https://static-cdn.jtvnw.net/ttv-boxart/Hearthstone.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(hearthstone)

borderlands2 = Game.new(
  name: 'Borderlands 2',
  photo: 'https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcVFjkF.IY54D8IdonYYcBsBHtmv3P4VSg9M0TbKyY._wPrXaf4OoVEQ3xLSloGYJS7btCHohMn5DhSeFzxioTnyuYzAggrg0LIdsvlajW8NHX39sTB2KcKzc8s0_No7pKvjQQmbKdne7rS8m8W4B8tor3T0_CG2__weT8WMYoNuM-'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(borderlands2)

factorio = Game.new(
  name: 'Factorio',
  photo: 'https://hb.imgix.net/cb5424b775d4a6ac28320eb5b30dcc7b97963185.jpg?auto=compress,format&fit=crop&h=353&w=616&s=cf3e481fa618c41377308a1ecd902e1d'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(factorio)

pubg = Game.new(
  name: "Playerunknown's Battlegrounds",
  photo: 'https://upload.wikimedia.org/wikipedia/pt/6/60/PlayerUnknown%E2%80%99s_Battlegrounds_cover.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(pubg)

cs = Game.new(
  name: 'Counter-Strike Global Offensive',
  photo: 'https://haste.net/wp-content/uploads/2017/11/Haste-csgo-cover.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(cs)

fifa = Game.new(
  name: 'Fifa 19',
  photo: 'https://s2.gaming-cdn.com/images/products/2665/orig/fifa-19-cover.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(fifa)

destiny = Game.new(
  name: 'Destiny 2',
  photo: 'https://s3.gaming-cdn.com/images/products/1919/271x377/destiny-2-cover.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(destiny)

warframe = Game.new(
  name: 'Warframe',
  photo: 'https://www.mobygames.com/images/covers/l/364846-warframe-xbox-one-front-cover.png'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(warframe)

garys = Game.new(
  name: "Garry's Mod",
  photo: "https://i.imgur.com/gj1aJJF.jpg"
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(garys)

brawlhalla = Game.new(
  name: 'Brawlhalla',
  photo: 'https://haste.net/wp-content/uploads/2017/11/Haste-Brawlhalla-Cover.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(brawlhalla)

gta = Game.new(
  name: "Grand Theft Auto V",
  photo: "https://s3.gaming-cdn.com/images/products/4211/orig/grand-theft-auto-v-premium-online-edition-cover.jpg"
  # banner: "https://i.imgur.com/XnLkFVa.jpg"
)
record_new(gta)

dst = Game.new(
  name: "Don't Starve Together",
  photo: 'https://images.g2a.com/newlayout/323x433/1x1x0/73734d4694f1/591211a0ae653a05e711d0bf'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(dst)

broforce = Game.new(
  name: 'Broforce',
  photo: 'https://s1.gaming-cdn.com/images/products/1086/271x377/broforce-cover.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
)
record_new(broforce)

ass = Game.new(
  name: 'Assassins Creed III',
  photo: 'https://http2.mlstatic.com/assassins-creed-iii-remastered-midia-fisica-pc-dvd-D_NQ_NP_998247-MLB29758883631_032019-F.jpg'
  # banner: "https://images8.alphacoders.com/990/990551.jpg"
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

User.all.each { |ad| next unless ad.admin; puts "\n --- #{ad.name} is a swebbersittersons Admin!"}

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
