require 'spec_helper'
require './lib/text'


RSpec.describe Text do
  describe "#translate" do

    it "turns a single braille character into a single text character" do
      incoming_braille = [
        [
          [
            ["0", "."],
            [".", "."],
            [".", "."],
          ],
        ]
      ]
      expected = "a"
      expect(subject.translate(incoming_braille)).to eq(expected)
    end 
  end
end
