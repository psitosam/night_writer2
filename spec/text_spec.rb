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

  describe "#render" do
    it "takes an array of strings and turns it into a braille array" do
      input = [
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

      output = [
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
      expect(subject.render(input)).to eq(output)
    end
  end
end
