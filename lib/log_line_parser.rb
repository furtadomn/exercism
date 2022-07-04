# frozen_string_literal: true

class LogLineParser
  attr_reader :msg

  def initialize(msg)
    @msg = msg
  end

  def message
    msg.split(':')[1].strip
  end

  def log_level
    msg.split(':')[0].strip.tr('[]', '').downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
