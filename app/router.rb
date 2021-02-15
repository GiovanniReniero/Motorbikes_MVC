# require_relative "controllers/motorbikes_controller.rb" #...?
require 'pry-byebug'
class Router
  attr_reader :controller

  def initialize (attributes = {})
    @motorbikes_controller = attributes[:motorbikes_controller]
  end

  def run
    print_welcome
    loop do
      sleep(1)
      print_menu
      action = gets.chomp.to_i
      # binding.pry
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
      when 1 then @motorbikes_controller.index
      when 2 then @motorbikes_controller.year
      when 3 then @motorbikes_controller.brand
      when 4 then @motorbikes_controller.drop 
      # when 5 then @motorbikes_controller.add
      # when 6 then @motorbikes_controller.delete
      # when 7 then @motorbikes_controller.update
    else 
      puts ''
      puts "Please make a proper selection..."
      sleep(1)
    end
  end

  def actions
    [
      "List all bikes",
      "List by year",
      "List by make or model",
      # "Edit a Bike",
      # "Add a Bike",
      # "Delete a post",
      # "Mark favorite",
      "Exit"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "-----------------------------"
    puts "Welcome to Motorbikes_MVC"
    puts "Returns some notable motorcycle models introduced on the market in the years between 1962 and 2018."
    puts "All data from Wikipedia."
    puts "-----------------------------"
  end
end

