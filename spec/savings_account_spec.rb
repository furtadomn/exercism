# frozen_string_literal: true

require 'savings_account'

RSpec.describe SavingsAccount do
  balance = 200.75
  desired_balance = 214.88

  describe '.interest_rate' do
    it 'calculates the interest rate' do
      expect(described_class.interest_rate(balance)).to eq(0.5)
      expect(described_class.interest_rate(-300.0)).to eq(-3.213)
    end
  end

  describe '.annual_balance_update' do
    it 'calculates the annual balance update' do
      expect(described_class.annual_balance_update(balance)).to eq(201.75375)
    end
  end

  describe '.years_before_desired_balance' do
    it 'calculates the minimum number of years required to reach the desired balance' do
      expect(described_class.years_before_desired_balance(balance, desired_balance)).to eq(14)
    end
  end
end
