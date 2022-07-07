# frozen_string_literal: true

class AssemblyLine
  attr_reader :speed

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    production = speed * 221

    case speed
    when 1..4
      production * 1
    when 5..8
      production * 0.9
    when 9
      production * 0.8
    when 10
      production * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
