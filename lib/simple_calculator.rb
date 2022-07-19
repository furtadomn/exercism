# frozen_string_literal: true

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(num1, num2, operator)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operator)
    raise ArgumentError if num1.class != Integer || num2.class != Integer

    res = [operator].map { |op| num1.method(op).(num2) }.first
    "#{num1} #{operator} #{num2} = #{res}"
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end

  class UnsupportedOperation < StandardError; end
end
