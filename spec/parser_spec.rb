# frozen_string_literal: true

require_relative '../parser'
test_file = './data/test_log_file.log'

RSpec.describe Parser do
  before do
    @parser = Parser.new(test_file)
  end

  describe '#initialize' do
    it 'creates a new instance of parser when passed a log file' do
      expect(@parser).to be_instance_of(Parser)
    end
  end

  describe '#file_length' do
    it 'returns an integer' do
      expect(@parser.file_length).to be_a_kind_of(Numeric)
    end

    it 'returns 20 for a 20 line file' do
      expect(@parser.file_length).to eq(20)
    end
  end
end
