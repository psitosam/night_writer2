
require_relative 'braille'
require_relative 'text'

# array = []
# incoming_braille = []
# # #
# file = File.open(ARGV[0], "r") do |f|
#   f.lines.each do |line|
#     incoming_braille << line.split.map(&:to_s)
#     end
#     incoming_braille
#   end
#creates a nested array with each element being a line from the incoming_braille
#iterate over each nested array, taking the first two elements of each and feed it into a new array [[], [], []]
file = File.open(ARGV[0], "r")
incoming_braille = file.readlines.map(&:chomp)
file.close
#creates a single array with each element being a line of incoming braille
# file = File.open(ARGV[0], "r")
# incoming_braille = file.read
# file.close

# incoming_characters = Text.new.count_characters(incoming_braille)
# incoming_characters = []
# incoming_characters << incoming_braille

text = Text.new.translate(incoming_braille)
# translated = Text.new.render(text)

writer = File.open(ARGV[1], "w")
writer.write(text)
puts "Created '#{ARGV[1]}' containing #{text.size} characters"
writer.close
