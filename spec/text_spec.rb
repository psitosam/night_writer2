require 'spec_helper'
require './lib/text'


RSpec.describe Text do

  describe "dissect" do
    it "takes a string of plaintext and converts it to nested arrays of two characters each" do
      input = "0.00.."
      output = [["0."], ["00"], [".."]]
      expect(subject.dissect(input)).to eq(output)
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
end
