require_relative 'text_hash'

class Text

  def count_characters(input)
    characters = input.size
    return characters / 3
  end

  def dissect(input)
    array = []
    until input.empty? do
      # array.each_with_index {|row| row << input.slice!(0..1)}
      array << input.slice!(0..1)
    end
    array
  end

  def stack_rows(input)
    # require 'pry'; binding.pry
    input.map do |row|
      dissect(row)
    end
  end


  def check_for_valid_input(input)
    text_hash = TextHash::DICTIONARY
    if text_hash.keys.include?(input)
      TextHash::DICTIONARY[input]
    else
      TextHash::DICTIONARY[[
        [".", "."],
        [".", "."],
        [".", "."],
      ]]
    end
  end

  def translate(input)
    to_be_translated = []
    braille =  input.each do |char|
      check_for_valid_input(char)
    end
    to_be_translated += braille
  end

  # def render(input)
  #
  # end


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
