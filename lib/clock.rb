# frozen_string_literal: true
#rubocop: disable all

require 'time'
require 'pry'

class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  # Time is an abstraction of dates and times. Time is stored internally as
  # the number of seconds with fraction since the Epoch, January 1, 1970 00:00 UTC

  def to_s
    t = Time.at((hour * 60 * 60) + (minute * 60) + 10_800)
    # 10_800 seconds == 3 hours (UTC)
    # On the Exercism's editor, we don't need to add 10_800 seconds 

    t.strftime('%H:%M')
  end

  def +(clock)
    new_time = clock.to_s.split(':')
    add_hour = new_time.first.to_i + hour
    add_minute = new_time.last.to_i + minute

    Clock.new(hour: add_hour, minute: add_minute)
  end

  def -(clock)
    new_time = clock.to_s.split(':')
    sub_hour = hour - new_time.first.to_i
    sub_minute = minute - new_time.last.to_i

    Clock.new(hour: sub_hour, minute: sub_minute)
  end

  def ==(other_clock)
    other_time = other_clock.to_s.split(':')
    h = other_time.first.to_i
    m = other_time.last.to_i

    if @hour == 24
      @hour = 0
    end

    @hour == h && @minute == m
  end
end