# frozen_string_literal: true

# Class to parse logfiles into lines and feedback interesting data
class Parser
  attr_reader :lines

  def initialize(file)
    raise ArgumentError, 'File must be a logfile' unless File.extname(file) == '.log'

    @lines = File.readlines(file)
  end

  def file_length
    @lines.length
  end
end
