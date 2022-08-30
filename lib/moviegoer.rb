# frozen_string_literal: true

class Moviegoer
  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= 60 ? 10 : 15
  end

  def watch_scary_movie?
    age >= 18
  end

  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member

    '🍿'
  end
end

class NotMovieClubMemberError < RuntimeError; end
