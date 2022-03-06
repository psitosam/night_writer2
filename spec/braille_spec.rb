require 'spec_helper'
require './lib/braille'

RSpec.describe Braille do
  describe "#translate" do
    it "turns a string of characters into an array of braille characters" do
      incoming_text = "aa"
      outgoing_text = subject.translate(incoming_text)
      outgoing_array = [
        [
          ["0", "."],
          [".", "."],
          [".", "."],
        ],
        [
          ["0", "."],
          [".", "."],
          [".", "."],
        ]
      ]
      expect(outgoing_text).to eq(outgoing_array)
    end
  end

  describe "#check_for_valid_input" do
    it "checks for valid letters or spaces" do
      input = "@#!"
      expected = "Please enter a letter a - z or a space"
      expect(subject.check_for_valid_input).to eq(expected)
    end
  end

  describe "#render" do
    it "takes a braille array and turns it into an array of strings" do
      input = [
        [
          ["0", "."],
          [".", "."],
          [".", "."],
        ],
        [
          ["0", "."],
          [".", "."],
          [".", "."],
        ]
      ]
      output = [
        "0.0.",
        "....",
        "....",
      ]
      # require 'pry'; binding.pry
      expect(subject.render(input)).to eq(output)
    end
  end
end
