# frozen_string_literal: true

require_relative '../data_extractor'
require_relative '../parser'

test_file = './data/test_log_file.log'
lines = Parser.new(test_file).lines
# lines can also be a an array of strings, eg: ['/home 126.318.035.038', '/about 184.123.665.067', ...]

RSpec.describe DataExtractor do
  before do
    @extractor = DataExtractor.new
  end

  shared_examples_for 'page views' do |method|
    before do
      @result = @extractor.send(method, lines)
    end

    it 'Returns a hash' do
      expect(@result).to be_a_kind_of(Hash)
    end

    it 'Returns an empty hash when passed an empty array' do
      empty_result = @extractor.send(method, [])
      expect(empty_result).to eq({})
    end

    it 'Sorts logs by descending page views' do
      expect(@result.values).to eq(@result.values.sort.reverse)
    end
  end

  describe '#page_views_sorted' do
    include_examples 'page views', 'page_views_sorted'
  end

  describe '#unique_page_views_sorted' do
    include_examples 'page views', 'unique_page_views_sorted'
  end

  describe '#unique_visitors' do
    before do
      @result = @extractor.unique_visitors(lines)
    end

    it 'returns an integer' do
      expect(@result).to be_a_kind_of(Numeric)
    end

    it 'returns 12 when there are 12 unique ip addresses' do
      expect(@result).to eq(12)
    end
  end
end
