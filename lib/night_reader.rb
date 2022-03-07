
require_relative 'braille'
require_relative 'text'

file = File.open(ARGV[0], "r")

incoming_braille = file.read

file.close

# text = Text.new.translate(incoming_braille)
# translated = Text.new.render(text)

writer = File.open(ARGV[1], "w")
wrtier.write(incoming_braille)
puts "Created '#{ARGV[1]}' containing #{writer.size} characters"
writer.close
