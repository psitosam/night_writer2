require_relative 'braille_hash'

class Braille

  def translate(incoming_text, line_length = 40)
    message = []
    current_text = incoming_text

    until current_text.empty? do
      line = current_text.slice!(0...line_length)
      braille_line = line.chars.map do |char|
        check_for_valid_input(char)
      end
      message << braille_line
    end

    message
  end
# pull off the first 40 characters of string, run loop, repeat until no characters left.
  def render(braille_message)
    # require 'pry'; binding.pry
    braille_message.map do |line|
      array = ["", "", ""]
      line.each do |cell|
        array[0].concat(cell[0].join)
        array[1].concat(cell[1].join)
        array[2].concat(cell[2].join)
      end
      array
    end

  end

  def check_for_valid_input(char)
    braille_hash = BrailleHash::DICTIONARY
    if braille_hash.keys.include?(char)
      BrailleHash::DICTIONARY[char]
    else
      BrailleHash::DICTIONARY[" "]
    end
  end
end
