# frozen_string_literal: true

require 'scrabble_score'

RSpec.describe Scrabble do
  subject { Scrabble.new(word) } 

  describe '#score' do
    context 'when letters were passed' do
      let(:word) { 'street' }

      it 'returns the score' do
        expect(subject.score).to eq(6) 
      end
    end

    context 'when no letters were passed' do
      let(:word) { nil }

      it 'returns zero' do
        expect(subject.score).to eq(0) 
      end    
    end

    context 'when white spaces were passed' do
      let(:word) { " \t\n" }

      it 'returns zero' do
        expect(subject.score).to eq(0) 
      end    
    end
  end

  describe '.score' do
    context 'when letters were passed' do
      let(:word) { 'alacrity' }

      it 'returns the score' do
        expect(described_class.score(word)).to eq(13) 
      end    
    end
  end
end