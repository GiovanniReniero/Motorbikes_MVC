require "sqlite3"

# File.dirname("/home/gumby/work/ruby.rb")   #=> "/home/gumby/work"
# __FILE__ is the filename with extension of the file containing the code being executed

dir = File.dirname(__FILE__) 
DB = SQLite3::Database.new(File.join(dir, "db/motorbikes.db"))

# DB.execute('DROP TABLE IF EXISTS `motorbikes`;')
# create_statement = "
# CREATE TABLE `motorbikes` (
  # `motorbike_id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  # `make_and_model` TEXT(30),
  # `year` INTEGER,
  # );"
  
  #DB.execute(create_statement)
  
  
  
  
p dir
p "#{__FILE__}"
puts File.join(dir, "db/motorbikes.db")
puts Dir[File.join(dir, "app/**/*.rb")].sort