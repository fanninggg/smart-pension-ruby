# frozen_string_literal: true

# Class to extract various data points from array/could also be a module
class DataExtractor
  def page_views_sorted(lines)
    # Initialize hash with 0 as default values
    page_views = Hash.new(0)
    lines.each do |line|
      page_views[line.split[0]] += 1
    end
    sort_views(page_views)
  end

  def unique_page_views_sorted(lines)
    # Initialize hash with empty array as default values
    page_views = Hash.new { |h, k| h[k] = [] }
    lines.each do |line|
      page_views[line.split[0]] << line.split[1]
    end
    unique_page_views = page_views.transform_values { |v| v.uniq.count }
    sort_views(unique_page_views)
  end

  def sort_views(views_hash)
    views_hash.sort_by { |_key, value| -value }.to_h
  end

  def unique_visitors(lines)
    lines.map { |line| line.split[1] }.uniq.count
  end
end
