# frozen_string_literal: true

require_relative 'parser'
require_relative 'data_extractor'
require_relative 'view'

# Class to parse logfiles into lines and feedback interesting data
class Controller
  def initialize(file)
    @parser = Parser.new(file)
    @data_extractor = DataExtractor.new
    @view = View.new
  end

  def display_logs
    @view.display_array(@parser.lines)
  end

  def display_total_lines
    @view.display_integer(@parser.file_length)
  end

  def display_unique_visitors
    users = @data_extractor.unique_visitors(@parser.lines)
    @view.display_integer(users)
  end

  def display_sorted_views
    sorted_views = @data_extractor.page_views_sorted(@parser.lines)
    @view.display_hash(sorted_views)
  end

  def display_unique_sorted_views
    sorted_views = @data_extractor.unique_page_views_sorted(@parser.lines)
    @view.display_hash(sorted_views, unique: true)
  end
end
