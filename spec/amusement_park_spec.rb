# frozen_string_literal: true

# spec/amusement_park_spec.rb

require 'amusement_park'

RSpec.describe Attendee do
  subject { Attendee.new(height) }
  let(:height) { 150 }
  let(:pass_id) { rand(1..100) }

  describe '#height' do
    it 'returns the height' do
      expect(subject.height).to eq(height)
    end
  end

  describe '#pass_id' do
    context 'when the attendee has a pass id' do
      before do
        allow(subject).to receive(:pass_id).and_return(pass_id)
      end

      it 'returns pass id' do
        expect(subject.pass_id).to eq(pass_id)
      end
    end

    context 'when the attendee does not have a pass id' do
      it 'returns nil' do
        expect(subject.pass_id).to eq(nil)
      end
    end
  end

  describe '#issue_pass!' do
    context 'when the attendee does not have a pass id' do
      it 'issues a pass and returns a pass id' do
        expect(subject.issue_pass!(pass_id)).to eq(pass_id)
      end
    end
  end

  describe '#revoke_pass!' do
    context 'when the attendee breaks the rules' do
      it 'returns nil' do
        expect(subject.revoke_pass!).to eq(nil)
      end
    end
  end

  describe '#has_pass?' do
    context 'when the attendee has an pass' do
      before do
        allow(subject).to receive(:has_pass?).and_return(true)
      end
      
      it 'returns true' do
        expect(subject.has_pass?).to eq(true)
      end
    end

    context 'when the attendee has not an pass' do
      let(:pass_id) { nil }

      it 'returns false' do
        expect(subject.has_pass?).to eq(false)
      end
    end
  end

  describe '#fits_ride?' do
    let(:min_height) { 135 }

    context 'when the attendee fits a ride' do
      it 'returns true' do
        expect(subject.fits_ride?(min_height)).to eq(true)
      end
    end

    context 'when the attendee does not fits a ride' do
      let(:min_height) { 160 }

      it 'returns false' do
        expect(subject.fits_ride?(min_height)).to eq(false)
      end
    end
  end

  describe '#allowed_to_ride?' do
    let(:min_height) { 140 }
    
    before do
      allow(subject).to receive(:has_pass?).and_return(true)
    end

    context 'when attendee is allowed to go on a ride' do
      it 'returns true' do
        expect(subject.allowed_to_ride?(min_height)).to eq(true)
      end
    end
  end
end
