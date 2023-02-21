# frozen_string_literal: true

require 'rna_transcription'

RSpec.describe Complement do 
  let(:complement_of_dna) { described_class.of_dna(dna_strand) }

  describe '.of_dna' do
    context 'when there is an empty DNA strand' do
      let(:dna_strand) { '' }

      it 'returns an empty string' do
        expect(complement_of_dna).to  eq('')
      end
    end

    context 'when the DNA strand contains only adenine nucleotide' do
      let(:dna_strand) { 'A' }

      it 'returns the RNA complementary strand (uracil nucleotide)' do
        expect(complement_of_dna).to  eq('U')
      end
    end

    context 'when the DNA strand contains only thymine nucleotide' do
      let(:dna_strand) { 'T' }

      it 'returns the RNA complementary strand (adenine nucleotide)' do
        expect(complement_of_dna).to  eq('A')
      end
    end

    context 'when the DNA strand contains only cytosine nucleotide' do
      let(:dna_strand) { 'C' }

      it 'returns the RNA complementary strand (guanine nucleotide)' do
        expect(complement_of_dna).to  eq('G')
      end
    end

    context 'when the DNA strand contains only guanine nucleotide' do
      let(:dna_strand) { 'G' }

      it 'returns the RNA complementary strand (cytosine nucleotide)' do
        expect(complement_of_dna).to  eq('C')
      end
    end

    context 'when the DNA strand contains several nucleotides ' do
      let(:dna_strand) { 'ACGTGGTCTTAA' }

      it 'returns the RNA complementary strand' do
        expect(complement_of_dna).to  eq('UGCACCAGAAUU')
      end
    end
  end
end
