# frozen_string_literal: true

class Year
  class << self
    def leap?(year)
      divisible_by_4 = is_divisible_by_4?(year)
      divisible_by_100 = is_divisible_by_100?(year)
      divisible_by_400 = is_divisible_by_400?(year)

      (divisible_by_4 && !divisible_by_100) || (divisible_by_100 && divisible_by_400)
    end

    private

    def is_divisible_by_4?(year)
      year % 4 == 0
    end

    def is_divisible_by_100?(year)
      year % 100 == 0
    end

    def is_divisible_by_400?(year)
      year % 400 == 0
    end
  end
end
