require './braille_hash.rb'

class Braille

  def translate(incoming_text)
    braille = incoming_text.chars.map do |char|
      BrailleHash::DICTIONARY[char]
    end
  end

  def render(input)
    array = ["", "", ""]
    input.each do |cell|
      array[0].concat(cell[0].join)
      array[1].concat(cell[1].join)
      array[2].concat(cell[2].join)
    
    end
    array
  end
end
