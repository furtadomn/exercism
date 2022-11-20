# frozen_string_literal: true

require 'luhn'

RSpec.describe Luhn do
  subject { described_class.valid?(string) }

  context 'when the string has a length of 1 or less' do
    let(:string) { ['', '1', '0', ' 1'].sample }

    it { is_expected.to be_falsey }
  end

  context 'when the string contains non-digit characters' do
    let(:string) { ['59%59', '055b 444 285'].sample }

    it { is_expected.to be_falsey }
  end

  context 'when the sum of all of the digits is NOT divisible by 10' do
    let(:string) { '799 273 987 14' }

    it { is_expected.to be_falsey }
  end

  context 'when the sum of all of the digits is divisible by 10' do
    let(:string) { '79927398713' }

    it { is_expected.to be_truthy }
  end
end
