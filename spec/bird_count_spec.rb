# frozen_string_literal: true

require 'bird_count'

RSpec.describe BirdCount do
  subject { BirdCount.new([2, 5, 0, 7, 4, 1]) }

  describe '.last_week' do
    it 'returns last week\'s counts' do
      expect(described_class.last_week).to eq([0, 2, 5, 3, 7, 8, 4])
    end
  end

  describe '#yesterday' do
    it 'returns how many birds visited yesterday' do
      expect(subject.yesterday).to eq(4)
    end
  end

  describe '#total' do
    it 'returns the total number of visiting birds' do
      expect(subject.total).to eq(19)
    end
  end

  describe '#busy_days' do
    # a busy day is one where five or more birds have visited your garden
    it 'returns the number of busy days' do
      expect(subject.busy_days).to eq(2)
    end
  end

  describe '#day_without_birds?' do
    it 'checks if there was a day with no visiting birds' do
      expect(subject.day_without_birds?).to eq(true)
    end
  end
end
