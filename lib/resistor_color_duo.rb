# frozen_string_literal: true

class ResistorColorDuo
  def self.resistance_value(colors)
    first_two_bands = colors.slice!(0, 2)

    value = first_two_bands.map do |v|
      band_colors.key(v)
    end

    value.join.to_i
  end

  def self.band_colors
    { 0 => 'black',
      1 => 'brown',
      2 => 'red',
      3 => 'orange',
      4 => 'yellow',
      5 => 'green',
      6 => 'blue',
      7 => 'violet',
      8 => 'grey',
      9 => 'white' }
  end
end
