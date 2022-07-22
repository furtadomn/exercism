# frozen_string_literal: true

require 'acronym'

RSpec.describe Acronym do
  describe '.abbreviate' do
    context 'when all first letters are uppercase' do
      it 'returns the abbreviation' do
        expect(described_class.abbreviate('Portable Network Graphics')).to eq('PNG')
      end
    end

    context 'when some first letter is lowercase' do
      it 'returns the abbreviation' do
        expect(described_class.abbreviate('Ruby on Rails')).to eq('ROR')
      end
    end

    context 'when there is punctuation between the expression' do
      it 'returns the abbreviation' do
        expect(described_class.abbreviate('First In, First Out')).to eq('FIFO')
      end
    end

    context 'when there is punctuation between the expression without a whitespace' do
      it 'returns the abbreviation' do
        expect(described_class.abbreviate('Complementary metal-oxide semiconductor')).to eq('CMOS')
      end
    end
  end
end
