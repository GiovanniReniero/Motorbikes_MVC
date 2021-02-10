require "open-uri"
require "nokogiri"
require "byebug"

def motorcycles_by_year(year)
  url = "https://en.wikipedia.org/wiki/Category:Motorcycles_introduced_in_#{year}"
  unparsed_data = open(url).read
  parsed_data = Nokogiri::XML(unparsed_data)
  headers = parsed_data.css("div.mw-category div.mw-category-group ul li")
  bikes = []
  headers.each { |element| bikes << element.css('a').text}
  bikes.each_with_index do |element, i|
    puts "#{i}. #{element}"
  end
end
