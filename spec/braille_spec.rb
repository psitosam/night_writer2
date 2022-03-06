require 'spec_helper'
require './lib/braille'

RSpec.describe Braille do
  describe "#translate" do
    it "turns a string of characters into an array of braille characters" do
      incoming_text = "aaaaa"
      line_length = 2
      outgoing_text = subject.translate(incoming_text, line_length)
      outgoing_array = [
        [ #line 1
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ],
        [ #line 2
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ],
        [ #line 3
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ],
      ]
      expect(outgoing_text).to eq(outgoing_array)
    end
  end

  describe "#check_for_valid_input" do
    it "returns the bralle character for a valid input" do
      input = "a"
      expected = [
        ["0", "."],
        [".", "."],
        [".", "."],
      ]
      expect(subject.check_for_valid_input(input)).to eq(expected)
    end
    it "returns a space if the character is unrecognized" do
      input = "@"
      expected = [
        [".", "."],
        [".", "."],
        [".", "."],
      ]
      expect(subject.check_for_valid_input(input)).to eq(expected)
    end
  end

  describe "#render" do
    it "takes a braille array and turns it into an array of strings" do
      input = [
        [ #line 1
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ],
        [ #line 2
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ],
        [ #line 3
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ],
      ]
      output = [
        [
          "0.0.",
          "....",
          "....",
        ],
        [
          "0.0.",
          "....",
          "....",
        ],
        [
          "0.",
          "..",
          "..",
        ],
      ]

      # require 'pry'; binding.pry
      expect(subject.render(input)).to eq(output)
    end
  end

  describe "#output_width" do

  end
end
