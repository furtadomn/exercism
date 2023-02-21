# frozen_string_literal: true

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(slice)
    size = string.length

    raise ArgumentError if slice > size || slice <= 0

    result = []

    string.split('').each_cons(slice){ |serie| result << serie.join() }

    result
  end
end
