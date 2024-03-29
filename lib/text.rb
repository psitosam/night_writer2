require_relative 'text_hash'

class Text

  def count_characters(input)
    characters = input.size
    return characters / 3
  end

  def dissect(input)
    dissected = []
    until input.empty? do
      # array.each_with_index {|row| row << input.slice!(0..1)}
      dissected << input.slice!(0..1)
    end
    dissected
  end

  def stack_rows(input)
    # require 'pry'; binding.pry
    input.map do |row|
      dissect(row)
    end
  end

  def rows_to_braille(stacked_rows)
    # require 'pry'; binding.pry
    stacked_lines = []
    until stacked_rows.length == 0 do
      stacked_lines << stacked_rows.shift(3) #grouping by line
    end
    new_array = []
    result = stacked_lines.each do |line|

      row_1 = line[0] #take the first items from arrays in 102, 103, 104 and stick them together
      row_2 = line[1]
      row_3 = line[2]
      raw_braille_chars = row_1.zip(row_2, row_3)
      braille_chars = raw_braille_chars.map do |raw_char|
        braille_char = raw_char.map do |char_piece|
          char_piece.chars #could refactor to make a rows to braille and then raw to format: 41-43
        end
        new_array << braille_char
      end
    end
    new_array
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
    first_step = stack_rows(input)
    second_step = rows_to_braille(first_step)
    characters = second_step.map do |braille_char|
      check_for_valid_input(braille_char)
    end
    characters.join
  end
end
