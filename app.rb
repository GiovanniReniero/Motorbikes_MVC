require "sqlite3"
require "app/router"

DB = SQLite3::Database.new("db/motorbikes.db")

#seed the database here



Router.new.run