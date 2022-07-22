# frozen_string_literal: true

class Acronym
  def self.abbreviate(expression)
    expression.upcase.gsub('-', ' ').split.map do |l|
      l[0]
    end.join
  end
end
