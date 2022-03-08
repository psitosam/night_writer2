

module TextHash

  DICTIONARY = BrailleHash::DICTIONARY.invert
  # DICTIONARY = {
  #   [
  #     ["0", "."],
  #     [".", "."],
  #     [".", "."],
  #   ] => "a",
  #   [
  #     ["0", "."],
  #     ["0", "."],
  #     [".", "."],
  #   ] => "b",
  #   [
  #     [".", "."],
  #     [".", "."],
  #     [".", "."],
  #   ] => " ",
  # }
end
