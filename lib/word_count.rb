# frozen_string_literal: true

class WordCount
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    hash = Hash.new(0)
    regex = /(\\n|,|:|\.|\!|\&|\@|\$|\%|\^|\&|\ '|' )/

    phrase_array = phrase.downcase.gsub(regex, ' ').split

    phrase_array.each { |word| hash[word] += 1 }

    hash
  end
end

