# frozen_string_literal: true

class Hamming
  def self.compute(dna_strand, dna_replicated_strand)
    return 0 if dna_strand == dna_replicated_strand

    raise ArgumentError if dna_strand.length != dna_replicated_strand.length

    first_strand_array = dna_strand.split('')
    second_strand_array = dna_replicated_strand.split('')

    count = 0

    first_strand_array.each_with_index do |_, index|
      count += 1 if first_strand_array[index] != second_strand_array[index]
    end

    count
  end
end
