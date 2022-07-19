# frozen_string_literal: true

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(num1, num2, operator)
    raise Exceptions::UnsupportedOperation, 'Raises an UnsupportedOperation' unless ALLOWED_OPERATIONS.include?(operator)
    raise ArgumentError, 'Raises an ArgumentError' if num1.class != Integer || num2.class != Integer
    raise ZeroDivisionError, 'Division by zero is not allowed.' if num2 == 0 && operator == '/'

    res = [operator].map { |op| num1.method(op).(num2) }.first
    "#{num1} #{operator} #{num2} = #{res}"
  end

  class Exceptions
    class Error < StandardError; end
    class UnsupportedOperation < Error; end
  end
end
