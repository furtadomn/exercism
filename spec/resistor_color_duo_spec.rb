# frozen_string_literal: true

require 'resistor_color_duo'

RSpec.describe ResistorColorDuo do
  describe '.resistance_value' do
    context 'when the input is only two colors' do
      let(:colors) { %w[brown black] }

      it 'returns the resistence value' do
        expect(described_class.resistance_value(colors)).to eq(10)
      end
    end

    context 'when the input is more than two colors' do
      let(:colors) { %w[green brown orange] }

      it 'returns the resistence value' do
        expect(described_class.resistance_value(colors)).to eq(51)
      end
    end
  end
end
