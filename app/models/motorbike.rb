require "pry-byebug"
require "sqlite3"
DB = SQLite3::Database.new "../../db/motorbikes.db"

class Motorbike
  attr_accessor :make_and_model, :year
  attr_reader :motorbike_id

  def initialize(attributes = {})
    @motorbike_id = attributes[:motorbike_id]
    @make_and_model = attributes[:make_and_model]
    @year = attributes[:year]
  end
  # compare your code with that of Hacker news!!

  def self.all
    DB.results_as_hash = true
     bikes = DB.execute("SELECT * FROM  motorbikes")
    #  binding.pry
     final = bikes.map { |bike| Motorbike.new( motorbike_id: bike["motorbike_id"], make_and_model: bike["make_and_model"], year: bike["year"] )}
    final # an array of Motorbike instances in hash form so an array of quasi~hashes
  end

  def self.find(n)
    # finds and instance based on the instance id 
    DB.results_as_hash = true
    if n.kind_of?(Integer)
      bikes = DB.execute("SELECT * FROM motorbikes WHERE motorbike_id = ?", n)
      bikes.empty? ? nil : final = bikes.map { |bike| Motorbike.new( motorbike_id: bike["motorbike_id"], make_and_model: bike["make_and_model"], year: bike["year"] )}
    end
3  end
  
  def self.find_by_name(string)
    #finds instances by name model or brand
    DB.results_as_hash = true
    if string.kind_of?(String)
      result = DB.execute("SELECT * FROM motorbikes WHERE make_and_model LIKE '%#{string}%'")
      result.empty? ? nil : result
    else
      nil
    end
  end
  
  def self.find_by_year(year)
    #finds instances by name model or brand
    DB.results_as_hash = true
    if year.kind_of?(Integer)
      bikes = DB.execute("SELECT * FROM motorbikes WHERE year = ?", year)
      # binding.pry
      bikes.empty? ? nil : final = bikes.map { |bike| Motorbike.new( motorbike_id: bike["motorbike_id"], make_and_model: bike["make_and_model"], year: bike["year"] )}
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
  