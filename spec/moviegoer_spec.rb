# frozen_string_literal: true

require 'moviegoer'

RSpec.describe Moviegoer do
  let(:subject) { Moviegoer.new(age, member: member) }
  let(:member) { false }

  describe '#ticket_price' do
    context 'when the moviegoer is 60 or older' do
      let(:age) { rand(60..100) }

      it 'pays 10.00 for a ticket' do
        expect(subject.ticket_price).to eq(10)
      end
    end

    context 'when the moviegoer is under 60' do
      let(:age) { rand(1..59) }

      it 'pays 15.00 for a ticket' do
        expect(subject.ticket_price).to eq(15)
      end
    end
  end

  describe '#watch_scary_movie?' do
    context 'when the moviegoer is 18 or older' do
      let(:age) { rand(18..100) }

      it 'allows watching the movie' do
        expect(subject.watch_scary_movie?).to be_truthy
      end
    end

    context 'when the moviegoer is under 18' do
      let(:age) { rand(1..17) }

      it 'does not allow watching the movie' do
        expect(subject.watch_scary_movie?).to be_falsey
      end
    end
  end

  describe '#claim_free_popcorn!' do
    let(:age) { rand(1..100) }

    context 'when a viewer is a movie club member' do
      let(:member) { true }

      it 'is rewarded with free popcorn' do
        expect(subject.claim_free_popcorn!).to eq('🍿')
      end
    end

    context 'when a viewer is NOT a movie club member' do
      it 'raises NotMovieClubMemberError exception' do
        expect { subject.claim_free_popcorn! }.to raise_error(NotMovieClubMemberError)
      end
    end
  end
end
