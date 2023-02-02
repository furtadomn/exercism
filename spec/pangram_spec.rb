# frozen_string_literal: true

require 'pangram'

RSpec.describe Pangram do
  let(:pangram) { Pangram.pangram?(sentence) }

  describe 'when the sentence is empty' do
    let(:sentence) { '' }

    it 'returns false' do
      expect(pangram).to eq(false)
    end
  end

  describe 'when the sentence is NOT empty' do
    describe 'when the sentence is a perfect lowercase alphabet sequence' do
      let(:sentence) { 'abcdefghijklmnopqrstuvwxyz' }

      it 'returns true' do
        expect(pangram).to eq(true)
      end
    end

    describe 'when there are all alphabet letters in the sentence' do
      let(:sentence) { 'the quick brown fox jumps over the lazy dog' }

      it 'returns true' do
        expect(pangram).to eq(true)
      end
    end

    describe 'when the letter x is missing in the sentence' do
      let(:sentence) { 'a quick movement of the enemy will jeopardize five gunboats' }

      it 'returns false' do
        expect(pangram).to eq(false)
      end
    end

    describe 'when there are underscores in the sentence' do
      let(:sentence) { 'the_quick_brown_fox_jumps_over_the_lazy_dog' }

      it 'returns true' do
        expect(pangram).to eq(true)
      end
    end

    describe 'when there are numbers in the sentence' do
      let(:sentence) { 'the 1 quick brown fox jumps over the 2 lazy dogs' }

      it 'returns true' do
        expect(pangram).to eq(true)
      end
    end

    describe 'when the letters in the sentence are replaced by numbers' do
      let(:sentence) { '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog' }

      it 'returns false' do
        expect(pangram).to eq(false)
      end
    end

    describe 'when there are mixed case and punctuation in the sentence' do
      let(:sentence) { '\"Five quacking Zephyrs jolt my wax bed.\"' }

      it 'returns true' do
        expect(pangram).to eq(true)
      end
    end
  end
end
