class Router
  def initialize
    @controller = MotorbikesController.new
  end

  def run
    print_welcome
    loop do
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.index
    when 2 then @controller.year
    when 3 then @controller.brand
    when 4 then @controller.add
    when 5 then @controller.delete
    when 6 then @controller.favourite
    end
  end

  def actions
    [
      "List all bikes"
      "Choose a year",
      "List by Brand"
      "Edit a Bike",
      "Add a Bike"
      "Delete a post",
      "Mark favorite"
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
    puts "Returns notable motorcycle models introduced on the market on any year from 1960 to 2018. All data  from Wikipedia."
    puts "-----------------------------"
  end
end

