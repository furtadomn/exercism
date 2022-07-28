# frozen_string_literal: true

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(slice)
    string.map { |n| array.slice(array[n], 2) }
  end

  # def self.slices
  #   array = string.split('')

  #   substring = array.map { |n| array.slice(array[n], 2) }
  # end
end
