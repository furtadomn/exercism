# frozen_string_literal: true

class Complement
  DNA_NUCLEOTIDES = %w[A T C G]
  COMPLEMENTARY_RNA_NUCLEOTIDES = %w[U A G C]

  def self.of_dna(dna_strand)
    return '' if dna_strand.empty?

    dna_nucleotides_array = dna_strand.split('')
    dna_nucleotides_index = dna_nucleotides_array.map { |nucleotide| DNA_NUCLEOTIDES.index(nucleotide)}
    rna_complementary_strand = dna_nucleotides_index.map { |index| COMPLEMENTARY_RNA_NUCLEOTIDES[index] }

    rna_complementary_strand.join()
  end
end