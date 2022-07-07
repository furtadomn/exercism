# frozen_string_literal: true

require 'assembly_line'

RSpec.describe AssemblyLine do
  subject { AssemblyLine.new(speed) }
  let(:speed) { 6 }

  describe '#production_rate_per_hour' do
    it 'calculates the production rate per hour' do
      expect(subject.production_rate_per_hour).to eq(1193.4)
    end
  end

  describe '#working_items_per_minute' do
    it 'calculates the production rate per minute' do
      expect(subject.working_items_per_minute).to eq(19)
    end
  end
end
