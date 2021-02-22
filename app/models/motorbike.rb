require "pry-byebug"
# require "sqlite3"
# DB = SQLite3::Database.new "../../db/motorbikes.db"

class Motorbike
  attr_accessor :make_and_model, :year
  attr_reader :motorbike_id

  def initialize(attributes = {})
    @motorbike_id = attributes[:motorbike_id]
    @make_and_model = attributes[:make_and_model]
    @year = attributes[:year]
  end

  def self.bikes_map(bikes)
    final = bikes.map { |bike| Motorbike.new( motorbike_id: bike["motorbike_id"], make_and_model: bike["make_and_model"], year: bike["year"] )}
  end

  def bikes_map(bikes)
    final = bikes.map { |bike| Motorbike.new( motorbike_id: bike["motorbike_id"], make_and_model: bike["make_and_model"], year: bike["year"] )}
  end

  def self.all
    DB.results_as_hash = true
    bikes = DB.execute("SELECT * FROM  motorbikes")    
    final = bikes_map(bikes)
    final 
    end

  def self.find(n)
    # finds and instance based on the instance id 
    DB.results_as_hash = true
    if n.kind_of?(Integer)
      bikes = DB.execute("SELECT * FROM motorbikes WHERE motorbike_id = ?", n)
      bikes.empty? ? nil : final = final = bikes_map(bikes) 
    end
  end

  def self.drop
    DB.execute('DROP TABLE IF EXISTS motorbikes')
    create_statement = "
    CREATE TABLE motorbikes (
      motorbike_id  INTEGER PRIMARY KEY AUTOINCREMENT,
      make_and_model TEXT(30),
      year INTEGER
    );"
    DB.execute(create_statement)
  end
  
  def self.find_by_name(string)
    #finds instances by name model or brand
    DB.results_as_hash = true
    if string.kind_of?(String)
      bikes = DB.execute("SELECT * FROM motorbikes WHERE make_and_model LIKE '%#{string}%'")
      bikes.empty? ? nil : final = bikes_map(bikes) 
    else
      nil
    end
  end
  
  def self.find_by_year(year)
    #finds instances by name model or brand
    DB.results_as_hash = true
    if year.kind_of?(Integer)
      bikes = DB.execute("SELECT * FROM motorbikes WHERE year = ?", year)
      bikes.empty? ? nil : final = bikes_map(bikes)
    else
      nil
    end
  end

  def save
    #adds and updates instances of motorbikes in DB
    if @motorbike_id.kind_of?(NilClass)
      DB.execute("INSERT INTO motorbikes (make_and_model, year) VALUES(?, ?)", @make_and_model, @year)
    else 
      DB.execute("UPDATE motorbikes SET (make_and_model, year) WHERE (?, ?)", motorbike.make_and_model, motorbike.year)
    end
  end

  def delete(id)
    #deletes an instance based on instance id
    DB.execute("DELETE FROM motorbikes WHERE motorbike_id = ?", id)
  end
end
  