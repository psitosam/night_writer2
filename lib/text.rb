

class Text

  def dissect(input)
    array = [[], [], []]
    until input.empty? do
      array.each_with_index {|x| x << input.slice!(0..1)}
    end
    array
  end

  # def braille_text_to_braille_array
  #   lines = s.split(?\n)
  #   longest = lines.map { |l| l.length }.max
  #   (0..longest).map do |index|
  #     lines.map {}
  # end

  # def render(input, line_length = 80)
  #   until input.empty? do
  #     line = input.slice(0..1)
  #   end
  # end
  # def render(input)
  #   array = ["", "", ""]
  #   require 'pry'; binding.pry
  #   input.each do |letter|
  #     letter.each do |line|
  #       array[0] << line[0]
  #       array[1] <<
  #     end
  #   end
  # end

  # def translate(incoming_braille)
  #   output = []
  #   braille_message_line_length = 80
  #
  #   until incoming_braille.empty? do
  #     line = incoming_braille.each do
end
