# require "sqlite3"
require_relative "app/router"
# require "db/seed"
# require "sqlite3"
# DB = SQLite3::Database.new "db/motorbikes.db"

# Instantiate a constant variable, DB, usable in all your files
# dir = File.dirname(__FILE__)
# DB = SQLite3::Database.new(File.join(dir, "db/motorbikes.db"))


# Require all the ruby files you have created in `app`
# Dir[File.join(dir, "app/**/*.rb")].sort.each { |file| require file }

# Launch the app!


Router.new.run



