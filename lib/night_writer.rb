
require_relative 'braille'

file = File.open(ARGV[0], "r")

incoming_text = file.read.delete("\n") #take the things in this file obj and put them into string form

file.close

braille = Braille.new.translate(incoming_text)
translated = Braille.new.render(braille)


# require 'pry'; binding.pry
writer = File.open(ARGV[1], "w")

translated.each do |line|
  line.each do |row|
    writer.write(row.concat("\n"))
  end
end


puts "Created '#{ARGV[1]}' containing #{writer.size} characters"

writer.close
