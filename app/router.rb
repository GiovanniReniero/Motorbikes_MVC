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
      # when 4 then @motorbikes_controller.add
      # when 5 then @motorbikes_controller.delete
      # when 6 then @motorbikes_controller.update
      when 4 then @motorbikes_controller.drop # needs to be fixed!
    else 
      puts ''
      sleep(1)
      puts "Please make a proper selection..."
      sleep(1)
    end
  end

  def actions
    [
      "List all bikes",
      "Choose a year",
      "List by Brand",
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
    puts "Returns some notable motorcycle models introduced on the market in the years between 1960 and 2018."
    puts "All data from Wikipedia."
    puts "-----------------------------"
  end
end

