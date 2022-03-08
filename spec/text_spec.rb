require 'spec_helper'
require './lib/text'


RSpec.describe Text do

  describe "#count_characters" do
    it "counts the number of incoming braille characters" do
      input = [
        ["0", "."],
        [".", "."],
        [".", "."],
      ]
      expected = 1
      expect(subject.count_characters(input)).to eq(expected)
    end
  end

  describe "#check_for_valid_input" do
    it "returns the English character for a valid Braille character" do
      input = [
        ["0", "."],
        [".", "."],
        [".", "."],
      ]
      expected = "a"
      expect(subject.check_for_valid_input(input)).to eq(expected)
    end

    it "returns a space if the character is not recognized" do
      input = [
        [".", "."],
        ["0", "."],
        [".", "."],
      ]
      expected = " "
      expect(subject.check_for_valid_input(input)).to eq(expected)
    end
  end

  describe "#translate" do
    it "turns a series of braille characters into a series of English letters" do
      input = ["0.0.", "..0.", "...."]
      expected = "ab"
         # require 'pry'; binding.pry
      expect(subject.translate(input)).to eq(expected)
    end

    it "can handle multiple lines of braille" do
      input = ["0.0.", "00.0", "....", "0.0.", "0.0.", "0.0."]
      expected = "hell"
      expect(subject.translate(input)).to eq(expected)
    end
  end


  describe "#dissect" do
    it "takes a string and converts it to nested arrays of two characters each" do
      input = "0.00.."
      output = ["0.", "00", ".."]
      expect(subject.dissect(input)).to eq(output)
    end
  end

  describe "#stack_rows" do
    it "takes an array of braille rows and breaks it into two digit chunks" do
      input = ["0.0.", "..0.", "...."]
      output = [
                ["0.", "0."],
                ["..", "0."],
                ["..", ".."],
              ]
      expect(subject.stack_rows(input)).to eq(output)
    end
  end

  describe "#rows_to_braille" do
    it "takes stacked rows and turns them into braille" do
      input = [
                ["0.", "0."],
                ["..", "0."],
                ["..", ".."],
              ]
      output = [
                [
                  ["0", "."],
                  [".", "."],
                  [".", "."],
                ],
                [
                  ["0", "."],
                  ["0", "."],
                  [".", "."],
                ],
              ]
      expect(subject.rows_to_braille(input)).to eq(output)
    end

    it "can handle more than one line of characters" do
      input = [["0.", "0."], ["00", ".0"], ["..", ".."], ["0.", "0."], ["0.", "0."], ["0.", "0."]]
      output = [
          [["0", "."], ["0", "0"], [".", "."]], #first character "h"
          [["0", "."], [".", "0"], [".", "."]],  #second character "e"
          [["0", "."], ["0", "."], ["0", "."]],
          [["0", "."], ["0", "."], ["0", "."]],
      ]
      expect(subject.rows_to_braille(input)).to eq(output)
    end
  end

  # describe "#braille_text_to_braille_array" do
  #   it "takes a single letter of braille in text form and converts it to a braille letter array" do
  #     input = "0.00.."
  #     output =
  #   end
  # end

  # describe "#render" do
  #
  #   it "takes a single braille letter and turns it into a braille array" do
  #     input =
  #     [
  #       [
  #         "0.0.",
  #         "....",
  #         "....",
  #       ]
  #     ]
  #
  #     output =
  #     [
  #       [
  #         ["0", "."],
  #         [".", "."],
  #         [".", "."],
  #       ]
  #     ]

  #     expect(subject.render(input)).to eq(output)
  #   end
  # end

  #   xit "takes an array of strings and turns it into a braille array" do
  #     input = [
  #       [
  #         "0.0.",
  #         "....",
  #         "....",
  #       ],
  #       [
  #         "0.0.",
  #         "....",
  #         "....",
  #       ],
  #       [
  #         "0.",
  #         "..",
  #         "..",
  #       ],
  #     ]
  #
  #     output = [
  #       [ #line 1
  #         [
  #           ["0", "."],
  #           [".", "."],
  #           [".", "."],
  #         ],
  #         [
  #           ["0", "."],
  #           [".", "."],
  #           [".", "."],
  #         ],
  #       ],
  #       [ #line 2
  #         [
  #           ["0", "."],
  #           [".", "."],
  #           [".", "."],
  #         ],
  #         [
  #           ["0", "."],
  #           [".", "."],
  #           [".", "."],
  #         ],
  #       ],
  #       [ #line 3
  #         [
  #           ["0", "."],
  #           [".", "."],
  #           [".", "."],
  #         ],
  #       ],
  #     ]
  #    # require 'pry'; binding.pry
  #     expect(subject.render(input)).to eq(output)
  #   end
  # end
  #
  # describe "#translate" do
  #
  #   xit "turns a single braille character into a single text character" do
  #     incoming_braille = [
  #       [
  #         [
  #           ["0", "."],
  #           [".", "."],
  #           [".", "."],
  #         ],
  #       ]
  #     ]
  #     expected = "a"
  #     expect(subject.translate(incoming_braille)).to eq(expected)
  #   end
  # end
  # describe "#create_lines" do
  #   it "takes an array of strings and separates them into nested arrays" do
  #     input = ["0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.", "00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0.", "....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.", "0....00.0.0.00..0.0.0.0.0....00.0.0.00", ".0..00.0000..0..00.00.0..0..00.0000..0", "0....00.0.0.........0.0.0....00.0.0..."]
  #
  #     output = [["0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0.0....00.0.0.00..0.0.0.0."], ["00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0..0..00.0000..0..00.00.0."], ["....0.0.0....00.0.0.........0.0.0....00.0.0.........0.0.0....00.0.0.........0.0."], []

end
