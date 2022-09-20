# frozen_string_literal: true

require 'isogram'

RSpec.describe Isogram do
  subject { described_class.isogram?(input) }

  describe '.isogram?' do
    context 'when the word is an isogram' do
      let(:input) { 'isogram' }

      it { is_expected.to be_truthy }

      context 'with character following hyphen' do
        let(:input) { 'six-year-old' }

        it { is_expected.to be_truthy }
      end

      context 'with uppercase character' do
        let(:input) { 'World' }

        it { is_expected.to be_truthy }
      end

      context 'with whitespaces' do
        let(:input) { 'Hey World' }

        it { is_expected.to be_truthy }
      end
    end

    context 'when the word is not an isogram' do
      let(:input) { 'eleven' }

      it { is_expected.to be_falsey }
    end
  end
end
