#ARGV prints out an Array [0, 1, 2, 3, 4]
* handle = File.open(ARGV[0], "r")

incoming text = handle.read

handle.close

puts incoming_text

capitalized text = incoming_text.upcase

writer = File.open(ARGV[1] "w")

writer.write(capitalized_text)

writer.close
