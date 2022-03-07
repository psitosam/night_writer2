
require_relative 'braille'

file = File.open(ARGV[0], "r")

incoming_braille = file.read

file.close

# text = Text.new.translate(incoming_braille)
# translated = Text.new.render(text)

writer = File.open(ARGV[1], "w")

puts "Created '#{ARGV[1]}' containing #{writer.size} characters"
writer.close
