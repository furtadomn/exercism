# frozen_string_literal: true

require 'hamming'

RSpec.describe Hamming do
  describe '.compute' do
    subject { Hamming.compute(dna_strand, dna_replicated_strand) }

    context 'when there is an empty DNA strand' do
      let(:dna_strand) { '' }
      let(:dna_replicated_strand) { '' }

      it { is_expected.to eq(0) }
    end

    context 'when there is an identical DNA strand' do
      context 'with a single letter' do
        let(:dna_strand) { 'A' }
        let(:dna_replicated_strand) { 'A' }

        it { is_expected.to eq(0) }
      end

      context 'with multiple letters' do
        let(:dna_strand) { 'GGACTGAAATCTG' }
        let(:dna_replicated_strand) { 'GGACTGAAATCTG' }

        it { is_expected.to eq(0) }
      end
    end

    context 'when there is a different DNA strand' do
      context 'with a single letter' do
        let(:dna_strand) { 'G' }
        let(:dna_replicated_strand) { 'T' }

        it { is_expected.to eq(1) }
      end

      context 'with multiple letters' do
        let(:dna_strand) { 'GGACGGATTCTG' }
        let(:dna_replicated_strand) { 'AGGACGGATTCT' }

        it { is_expected.to eq(9) }
      end
    end

    context 'when there is a disallow first DNA strand' do
      let(:dna_strand) { 'AATG' }
      let(:dna_replicated_strand) { 'AAA' }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when there is a disallow replicated/second DNA strand' do
      let(:dna_strand) { 'ATA' }
      let(:dna_replicated_strand) { 'AGTG' }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
