require "open-uri"
require "nokogiri"
require "sqlite3"
require "byebug"
dir = File.dirname(__FILE__) # Defines the root file 
DB = SQLite3::Database.new (File.join(dir, "db/motorbikes.db")) 

Dir.glob(File.join(dir, "app/**/*.rb")).sort.each { |file| require file } # Requires all the files needed to share database and Class initializations

view = MotorbikesView.new('') # Initialize model
controller = MotorbikesController.new(motorbikes_view: view) # Initialize Controller
router = Router.new(motorbikes_controller: controller) # Initilaize rooter

def motorcycles_by_year(year) # Scrape!
  url = "https://en.wikipedia.org/wiki/Category:Motorcycles_introduced_in_#{year}"
  unparsed_data = open(url).read
  parsed_data = Nokogiri::XML(unparsed_data)
  headers = parsed_data.css("div.mw-category div.mw-category-group ul li")
  make_and_model = []
  headers.each { |element| make_and_model << element.css('a').text}
  array = make_and_model.map { |element| Motorbike.new(make_and_model: element, year: year) }
  array.each { |bike| bike.save}
end

if Motorbike.all.empty?
  range = (1962..2018).to_a
  puts ".....Ssssscraping the net!...might take a few seconds."
  range.each { |year| motorcycles_by_year(year) }
end

router.run
