# frozen_string_literal: true

require 'raindrops'

RSpec.describe Raindrops do
  subject { described_class.convert(number) }

  describe '.convert' do
    context 'when the number has 3 as a factor' do
      let(:number) { 6 }

      it { is_expected.to eq('Pling') }
    end

    context 'when the number has 5 as a factor' do
      let(:number) { 10 }

      it { is_expected.to eq('Plang') }
    end

    context 'when the number has 7 as a factor' do
      let(:number) { 7 }

      it { is_expected.to eq('Plong') }
    end

    context 'when the number has 3 and 5 as a factor' do
      let(:number) { 15 }

      it { is_expected.to eq('PlingPlang') }
    end

    context 'when the number has 3 and 7 as a factor' do
      let(:number) { 21 }

      it { is_expected.to eq('PlingPlong') }
    end

    context 'when the number has 5 and 7 as a factor' do
      let(:number) { 35 }

      it { is_expected.to eq('PlangPlong') }
    end

    context 'when the number has 3, 5 and 7 as a factor' do
      let(:number) { 105 }

      it { is_expected.to eq('PlingPlangPlong') }
    end

    context 'when the number is not factored by 3, 5, or 7' do
      let(:number) { 34 }

      it { is_expected.to eq(number.to_s) }
    end
  end
end
