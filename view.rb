# frozen_string_literal: true

# Responsible purely for outputting data to the terminal
class View
  def display_hash(hash, unique: false)
    hash.each do |k, v|
      puts "#{k}: #{v}#{' unique' if unique} views"
    end
  end

  def display_integer(num)
    puts "Total: #{num}"
  end

  def display_array(array)
    array.each_with_index do |item, index|
      puts "#{index + 1}: #{item}"
    end
  end
end
