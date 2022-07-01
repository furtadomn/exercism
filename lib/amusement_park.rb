# frozen_string_literal: true

class Attendee
  attr_reader :height, :pass_id

  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  def has_pass?(pass_id)
    pass_id == nil ? false : true
  end

  def fits_ride?(min_height)
    height >= min_height
  end

  def allowed_to_ride?(min_height, pass_id)
    fits_ride?(min_height) && has_pass?(pass_id)
  end
end
