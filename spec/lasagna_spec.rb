# frozen_string_literal: true

# spec/lasagna_spec.rb

require 'lasagna'

RSpec.describe Lasagna do
  subject { Lasagna.new }

  it 'has an expected oven time' do
    expect(Lasagna::EXPECTED_MINUTES_IN_OVEN).to eq(40)
  end

  describe '#remaining_minutes_in_oven' do
    it 'calculates the remaining minutes in oven' do
      expect(subject.remaining_minutes_in_oven(30)).to eq(10)
    end
  end

  describe '#preparation_time_in_minutes' do
    context 'when there is one layer' do
      it 'calculates the preparation time in minutes' do
        expect(subject.preparation_time_in_minutes(1)).to eq(2)
      end
    end

    context 'when there are multiple layers' do
      layers = rand(2..20)
      res = layers * 2

      it 'calculates the preparation time in minutes' do
        expect(subject.preparation_time_in_minutes(layers)).to eq(res)
      end
    end
  end

  describe '#total_time_in_minutes' do
    describe 'when there is one layer' do
      it 'calculates the total time in minutes' do
        expect(subject.total_time_in_minutes(number_of_layers: 1, actual_minutes_in_oven: 30)).to eq(32)
      end
    end

    describe 'when there are multiple layers' do
      layers = rand(2..20)
      actual_min = rand(2..20)
      res = (layers * 2) + actual_min

      it 'calculates the total time in minutes' do
        expect(subject.total_time_in_minutes(number_of_layers: layers, actual_minutes_in_oven: actual_min)).to eq(res)
      end
    end
  end
end
