# frozen_string_literal: true

class SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      -3.213
    elsif balance >= 0 && balance < 1000
      0.5
    elsif balance >= 1000 && balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    rate = (interest_rate(balance) / 100) * balance.abs
    balance + rate
  end

  def self.years_before_desired_balance(balance, desired_balance)
    years_count = 0

    while balance < desired_balance
      balance = annual_balance_update(balance)
      years_count += 1
    end
    years_count
  end
end
