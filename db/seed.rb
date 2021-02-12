# seeds the database with all the scraped data

# require "open-uri"
# require "nokogiri"
# require "../models/motorbike"
# require "byebug"
# 
# def motorcycles_by_year(year)
  # url = "https://en.wikipedia.org/wiki/Category:Motorcycles_introduced_in_#{year}"
  # unparsed_data = open(url).read
  # parsed_data = Nokogiri::XML(unparsed_data)
  # headers = parsed_data.css("div.mw-category div.mw-category-group ul li")
  # make_and_model = []
  # headers.each { |element| make_and_model << element.css('a').text}
  # byebug
  # collection = make_and_model.map { |make_and_model| Motorbike.new(make_and_model: make_and, year: year)}
  
  # Here I have an array of instances that I need to feed into the database....how?
  
# end


require "sqlite3"
DB = SQLite3::Database.new "motorbikes.db"


