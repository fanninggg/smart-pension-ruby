# frozen_string_literal: true

# Class to act as a menu loop for users in the terminal
class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts 'Welcome to the logfile parser, discover what wonderful secrets your logfile holds!'
    puts '====='

    while @running
      display_menu
      action = gets.chomp.to_i
      menu_action(action)
    end
  end

  private

  def menu_action(action)
    case action
    when 1 then @controller.display_logs
    when 2 then @controller.display_total_lines
    when 3 then @controller.display_unique_visitors
    when 4 then @controller.display_sorted_views
    when 5 then @controller.display_unique_sorted_views
    when 6 then stop
    else
      puts 'Please press 1, 2, 3, 4, 5 or 6'
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ''
    puts 'What would you like to do?'
    puts '1 - Read all of the logs'
    puts '2 - Count the total number of page views'
    puts '3 - Count the total number of unique users'
    puts '4 - List webpages with most page views'
    puts '5 - List webpages with most unique page views'
    puts '6 - Stop and exit the program'
    print '>'
  end
end
