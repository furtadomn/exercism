# frozen_string_literal: true

# spec/log_line_parser_spec.rb

require 'log_line_parser'

RSpec.describe LogLineParser do
  subject { LogLineParser.new(msg) }
  let(:msg) { '[ERROR]: Invalid operation' }

  describe '#message' do
    context 'when there is a log message' do
      it 'returns the message' do
        expect(subject.message).to eq('Invalid operation')
      end
    end
  end

  describe '#log_level' do
    context 'when there is a log message' do
      it 'returns the log level' do
        expect(subject.log_level).to eq('error')
      end
    end
  end

  describe '#reformat' do
    context 'when there is a log message' do
      it 'returns the message first and the log level after it in parentheses' do
        expect(subject.reformat).to eq('Invalid operation (error)')
      end
    end
  end
end
