# frozen_string_literal: true

require 'two_fer'

RSpec.describe TwoFer do
  describe '.two_fer' do
    context 'when "name" is the given name' do
      let(:name) { 'Alice' }

      it 'returns the string' do
        expect(described_class.two_fer(name)).to eq('One for Alice, one for me.')
      end
    end

    context 'when the name is missing' do
      it 'returns the string' do
        expect(described_class.two_fer).to eq('One for you, one for me.')
      end
    end
  end
end
