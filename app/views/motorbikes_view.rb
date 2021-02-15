require 'pry-byebug'

class MotorbikesView
  attr_reader :view

  def initialize(view)
    @view
  end
  
  def all(array)
    array.each { |element| puts "#{element.motorbike_id}, #{element.make_and_model}, #{element.year}" }
  end
  
  def get_something(string)
    sleep(1)
    puts "Please choose a year, brand or model:"
    print "> "
    answer = gets.chomp
    # binding.pry
    if string == 'year'
      reply = answer.to_i
      if (1960..2018).to_a.include?(reply)
        return reply
      else
        nil
      end
    else
      answer
    end
  end
  
  def dropping
    puts "Clearing database...."
  end

  def farewell
    puts "Database cleared...shuting down."
    sleep(1)
  end
  
  

end