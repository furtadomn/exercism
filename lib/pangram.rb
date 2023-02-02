# frozen_string_literal: true

class Pangram
  def self.pangram?(sentence)
    return false if sentence.empty?

    alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
    regex = /(\|,|"|\\|:|\.|!|_|[0-9]| |)/

    check_sentence = sentence.downcase.gsub(regex, '').split('').sort.uniq
    check_sentence.sort == alphabet
  end
end
