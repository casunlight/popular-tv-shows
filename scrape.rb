require_relative 'lib/tv_show'
require_relative 'lib/pirate_bay'

top_tv_shows = PirateBay.new
tv_shows = top_tv_shows.shows

# buffy = TVShow.new
# buffy.name = "Buffy"
# buffy.episode = "S01E01"

# buffy2 = TVShow.new
# buffy2.name = "Buffy"
# buffy2.episode = "S01E02"


# tv_shows = [buffy, buffy2]

grouped_shows = {}

tv_shows.each do |tv_show|
  grouped_shows[tv_show.name] ||= {}
  grouped_shows[tv_show.name][tv_show.episode] ||=  tv_show.href
end

binding.pry

loop do
  puts "list or download"
  command = gets.downcase.strip
  
  case command
  when "list"
    grouped_shows.each do |show_name, show_hash|
      puts "#{show_name}: #{show_hash.keys.join(",")}"
    end
  when "download"
    puts "Enter a show and and episode #"
    puts "ex: The Big Bang Theory - S07E01"
    selection = gets.strip
    show = selection.split(" - ").first
    episode = selection.split(" - ").last

    href = grouped_shows[show][episode]

    system("open #{href}")
  when "exit"
    break
  end
end



