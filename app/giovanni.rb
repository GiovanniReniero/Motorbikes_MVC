# require "sqlite3"

dir = File.dirname(__FILE__)
# DB = SQLite3::Database.new(File.join(dir, "db/motorbikes.db"))

p dir
p File.join(dir, "db/motorbikes.db")