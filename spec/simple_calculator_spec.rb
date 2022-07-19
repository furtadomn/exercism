# frozen_string_literal: true

require 'simple_calculator'

RSpec.describe SimpleCalculator do
  describe '.calculate' do
    context 'when the operation is successful' do
      it 'returns the operation and the result' do
        expect(described_class.calculate(22, 25, '+')).to eq('22 + 25 = 47')
        expect(described_class.calculate(3, 21, '*')).to eq('3 * 21 = 63')
        expect(described_class.calculate(72, 9, '/')).to eq('72 / 9 = 8')
      end
    end

    context 'when operation symbol is unknown' do
      it 'raises an UnsupportedOperation' do
        expect { described_class.calculate(1, 2, '-') }.to raise_error(SimpleCalculator::UnsupportedOperation)
      end
    end

    context 'when the argument type is invalid' do
      it 'raises an ArgumentError' do
        expect { described_class.calculate(1, '2', '*') }.to raise_error(ArgumentError)
      end
    end

    context 'when the divisor is zero' do
      it 'raises a ZeroDivisionError' do
        allow(described_class).to receive(:calculate).with(512, 0, '/').and_raise('Division by zero is not allowed.')
        expect { described_class.calculate(512, 0, '/') }.to raise_error('Division by zero is not allowed.')
      end
    end
  end
end
