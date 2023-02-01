# frozen_string_literal: true

require 'clock'
require 'time'

RSpec.describe Clock do
  context 'when there is just the hour argument' do
    let(:hour) { 8 }

    it 'returns 08:00' do
      expect(Clock.new(hour: hour).to_s).to eq('08:00')
    end
  end

  context 'when there are the hour and the minute arguments' do
    let(:hour) { 8 }
    let(:minute) { 9 }

    it 'returns 08:09' do
      expect(Clock.new(hour: hour, minute: minute).to_s).to eq('08:09')
    end

    context 'when I need to add minutes to the clock' do
      clock = Clock.new(hour: 10, minute: 0)

      it 'returns 10:03' do
        expect((clock + Clock.new(minute: 3)).to_s).to eq('10:03')
      end
    end

    context 'when I need to subtract minutes to the clock' do
      clock = Clock.new(hour: 10, minute: 3)

      it 'returns 10:00' do
        expect((clock - Clock.new(minute: 3)).to_s).to eq('10:00')
      end
    end
  end

  context 'when there are two clocks to compare the time' do
    context 'when the times are different' do
      clock1 = Clock.new(hour: 10, minute: 0)
      clock2 = Clock.new(hour: 12, minute: 0)

      it 'returns false' do
        expect(clock1).not_to eq(clock2)
      end
    end

    context 'when the times are equal' do
      clock1 = Clock.new(hour: 10, minute: 0)
      clock2 = Clock.new(hour: 10, minute: 0)

      it 'returns true' do
        expect(clock1).to eq(clock2)
      end
    end

    context 'when there is a full clock and a zeroed clock' do
      clock1 = Clock.new(hour: 24, minute: 0)
      clock2 = Clock.new(hour: 0, minute: 0)

      it 'returns true' do
        expect(clock1).to eq(clock2)
      end
    end

    context 'when there are clocks with negative hours and minutes' do
      clock1 = Clock.new(hour: 7, minute: 32)
      clock2 = Clock.new(hour: -12, minute: -268)

      it 'returns true' do
        expect(clock1).to eq(clock2)
      end
    end
  end
end
