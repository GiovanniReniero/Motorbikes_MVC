require "sqlite3"

dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir, "db/motorbikes.db"))

DB.execute('DROP TABLE IF EXISTS `motorbikes`;')
create_statement = "
CREATE TABLE `motorbikes` (
  `motorbike_id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `make_and_model` TEXT(30),
  `year` INTEGER,
);"
DB.execute(create_statement)