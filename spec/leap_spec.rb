# frozen_string_literal: true

require 'leap'

RSpec.describe Year do
  describe '.leap?' do
    subject { described_class.leap?(year) }

    context 'when the year is not divisible by 4' do
      let(:year) { 2023 }

      it { is_expected.to eq(false) }
    end

    context 'when the year is divisible by 4' do
      context 'when the year is divisible by 100' do
        context 'when the year is divisible by 400' do
          let(:year) { 2000 }

          it { is_expected.to eq(true) }
        end

        context 'when the year is not divisible by 400' do
          let(:year) { 1900 }

          it { is_expected.to eq(false) }
        end
      end

      context 'when the year is not divisible by 100' do
        let(:year) { 1600 }

        it { is_expected.to eq(true) }
      end
    end
  end
end
