require_relative 'braille_hash'

class Braille

  def translate(incoming_text)
    braille = incoming_text.chars.map do |char|
      BrailleHash::DICTIONARY[char]
    end
  end

  def render(input)
    # require 'pry'; binding.pry
    array = ["", "", ""]
    input.each do |cell|
      array[0].concat(cell[0].join)
      array[1].concat(cell[1].join)
      array[2].concat(cell[2].join)

    end
    array
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
