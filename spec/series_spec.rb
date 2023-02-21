# frozen_string_literal: true

require 'series'

RSpec.describe Series do
  subject { Series.new(string) }

  describe '#series' do
    context 'when the slice is one from one' do
      let(:string) { '1' }

      it 'returns the substring' do
        expect(subject.slices(1)).to eq(%w[1])
      end
    end

    context 'when the slice is one from two' do
      let(:string) { '12' }

      it 'returns the substring' do
        expect(subject.slices(1)).to eq(%w[1 2])
      end
    end

    context 'when the slices are two from two' do
      let(:string) { '35' }

      it 'returns the substring' do
        expect(subject.slices(2)).to eq(%w[35])
      end
    end

    context 'when the slices of two overlap' do
      let(:string) { '9142' }

      it 'returns the substring' do
        expect(subject.slices(2)).to eq(%w[91 14 42])
      end
    end

    context 'when the slices can include duplicates' do
      let(:string) { '777777' }

      it 'returns the substring' do
        expect(subject.slices(3)).to eq(%w[777 777 777 777])
      end
    end

    context 'when the slices can include duplicates' do
      let(:string) { '918493904243' }

      it 'returns the substring' do
        expect(subject.slices(5)).to eq(%w[91849 18493 84939 49390 93904 39042 90424 04243])
      end
    end

    context 'when the slice length is too large' do
      let(:string) { '12345' }

      it 'raises ArgumentError' do
        expect { subject.slices(6) }.to raise_error(ArgumentError)
      end
    end

    context 'when the string is empty' do
      let(:string) { '' }

      it 'raises ArgumentError' do
        expect { subject.slices(1) }.to raise_error(ArgumentError)
      end
    end

    context 'when the slice is zero' do
      let(:string) { '12345' }

      it 'raises ArgumentError' do
        expect { subject.slices(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when the slice length is negative' do
      let(:string) { '123' }

      it 'raises ArgumentError' do
        expect { subject.slices(-1) }.to raise_error(ArgumentError)
      end
    end
  end
end
