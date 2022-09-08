# frozen_string_literal: true

require 'word_count'

RSpec.describe WordCount do
  subject { WordCount.new(phrase) }

  describe '#word_count' do
    context 'when there is one word in the phrase' do
      let(:phrase) { 'word' }
      let(:hash) { { 'word' => 1 } }

      it 'returns a hash with the word and its count' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there is more than one word in the phrase' do
      let(:phrase) { 'one of each' }
      let(:hash) {  { 'one' => 1, 'of' => 1, 'each' => 1 } }

      it 'returns a hash with the words and their counts' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are repeated words in the phrase' do
      let(:phrase) { 'one fish two fish red fish blue fish' }
      let(:hash) { { 'one' => 1, 'fish' => 4, 'two' => 1, 'red' => 1, 'blue' => 1 } }

      it 'returns a hash with the words and their counts, grouping the repeated words' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are cramped lists' do
      let(:phrase) { 'one,two,three' }
      let(:hash) { { 'one' => 1, 'two' => 1, 'three' => 1 } }

      it 'returns a hash with the words and their counts, removing the commas' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are expanded lists' do
      let(:phrase) { 'one,\ntwo,\nthree' }
      let(:hash) { { 'one' => 1, 'two' => 1, 'three' => 1 } }

      it 'returns a hash with the words and their counts, removing the line breaks ' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are apostrophes and colons' do
      let(:phrase) { "First: don't laugh. Then: don't cry." }
      let(:hash) { { 'first' => 1, "don't" => 2, 'laugh' => 1, 'then' => 1, 'cry' => 1 } }

      it 'returns a hash with the words and their counts, removing the colon and maintaining the apostrophes' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are multiple spaces not detected as a word' do
      let(:phrase) { ' multiple   whitespaces' }
      let(:hash) { { 'multiple' => 1, 'whitespaces' => 1 } }

      it 'returns a hash with the words and their counts, removing the white spaces' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are quotations' do
      let(:phrase) { "Joe can't tell between 'large' and large." }
      let(:hash) { { 'joe' => 1, "can't" => 1, 'tell' => 1, 'between' => 1, 'large' => 2, 'and' => 1 } }

      it 'returns a hash with the words and their counts, removing the quotations' do
        expect(subject.word_count).to eq(hash)
      end
    end

    context 'when there are ponctuation' do
      let(:phrase) { 'car: carpet as java: javascript!!&@$%^&' }
      let(:hash) { { 'car' => 1, 'carpet' => 1, 'as' => 1, 'java' => 1, 'javascript' => 1 } }

      it 'returns a hash with the words and their counts, removing the ponctuation' do
        expect(subject.word_count).to eq(hash)
      end
    end
  end
end
