# frozen_string_literal: true

require 'high_scores'

RSpec.describe HighScores do
  subject { HighScores.new(scores) }
  let(:scores) { [30, 50, 100, 20, 70] }

  describe '#scores' do
    it 'returns the scores' do
      expect(subject.scores).to eq([30, 50, 100, 20, 70])
    end
  end

  describe '#latest' do
    it 'returns the last score' do
      expect(subject.latest).to eq(70)
    end
  end

  describe '#personal_best' do
    it 'returns the best score' do
      expect(subject.personal_best).to eq(100)
    end
  end

  describe '#personal_top_three' do
    it 'returns the top three best score' do
      expect(subject.personal_top_three).to eq([100, 70, 50])
    end
  end

  describe '#latest_is_personal_best?' do
    context 'when the latest is the personal best' do
      let(:scores) { [30, 50, 100, 20, 70, 200] }

      it 'returns true' do
        expect(subject.latest_is_personal_best?).to be_truthy
      end
    end

    context 'when the latest is NOT the personal best' do
      it 'returns false' do
        expect(subject.latest_is_personal_best?).to be_falsey
      end
    end
  end
end
