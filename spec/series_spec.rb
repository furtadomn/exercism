# frozen_string_literal: true

require 'series'

RSpec.describe Series do
  subject { Series.new(string) }

  describe '#series' do
    let(:string) { '49142' }

    context 'when the substring has 3-digit series' do
      it 'returns the substring' do
        expect(subject.slices(3)).to eq(%w[491 914 142])
      end
    end
  end
end
