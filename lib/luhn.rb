# frozen_string_literal: true

class Luhn
  def self.valid?(string)
    return false if string.delete(' ').length <= 1 || string.delete(' ').match?(/^[0-9]*$/) == false

    array_digits = string.delete(' ').split('').map(&:to_i).reverse

    sum = 0

    array_digits.each_with_index do |num, index|
      if index.odd?
        double = num * 2
        sum += if double > 9
                 double - 9
               else
                 double
               end
      end

      sum += num if index.even?
    end

    (sum % 10).zero? ? true : false
  end
end
