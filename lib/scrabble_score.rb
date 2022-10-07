# frozen_string_literal: true

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless word

    word_array = word.upcase.gsub(/[^a-zA-Z]/, "").split('')
    score = 0

    word_array.each do |letter|
      if %w[A E I O U L N R S T].include?(letter)
        score += 1
      elsif %w[D, G].include?(letter)
        score += 2
      elsif %w[B C M P].include?(letter)
        score += 3
      elsif %w[F H V W Y].include?(letter)
        score += 4
      elsif %w[K].include?(letter)
        score += 5
      elsif %w[J X].include?(letter)
        score += 8
      elsif %w[Q Z].include?(letter)
        score += 10
      else
        score += 0
      end
    end

    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end