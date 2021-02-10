require_relative "motorbikes"
require "date"

def require_year
  puts "Returns notable motorcycle models introduced into the international market on any year from 1960 onwards. All data  from Wikipedia."
  p "Choose a year...."
  year = gets.chomp.to_i
  if  year >= 1960  &&  year < Date.today.year
    motorcycles_by_year(year)
  end
end

require_year

# Create a small app that makes the use of MVC and stores the scraped bikes into an sqlite database, has an app page, a router page and user friendly dashboard. make use of a git repository for all of this.