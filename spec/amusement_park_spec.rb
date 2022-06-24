# frozen_string_literal: true

# spec/amusement_park_spec.rb

require 'amusement_park'

RSpec.describe Attendee do
  height = rand(100..200)
  subject { Attendee.new(height) }

  describe '#height' do
    it 'returns the height' do
      expect(subject.height).to eq(height)
    end
  end

  describe '#pass_id' do
    context 'when the attendee has a pass id' do
      pass_id = rand(1..100)

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
      pass_id = rand(1..100)

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
end
