class MotorbikesView
  attr_reader :view

  def initialize(view)
    @view
  end
  
  def all(array)
    array.each { |element| puts "#{element.motorbike_id}, #{element.make_and_model}, #{element.year}" }
  end
  
  def get_something(string)
    sleep(0.5)
    puts "Please choose a year, brand or model:"
    print "> "
    answer = gets.chomp
    if string == 'year'
      reply = answer.to_i
      (1962..2018).to_a.include?(reply) ? reply : nil
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
