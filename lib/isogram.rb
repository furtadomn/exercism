# frozen_string_literal: true

class Isogram
  def self.isogram?(input)
    letters_array = input.downcase.delete(' ').gsub('-', '').split('')
    letters_array == letters_array.uniq
  end
end
