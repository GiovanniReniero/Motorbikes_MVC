class Motorbike

  def initialize(attributes = {})
    @motorbike_id = attributes[:motorbike_id]
    @make_and_model = attributes[:make_and_model]
    @year = attributes[:year]
  end
  

  def self.all
     DB.execute("SELECT * FROM  motorbikes")
  end

  def self.find(n)
    # finds and instance based on the instance id 
    if n.kind_of?(Integer)
      motorbike = DB.execute("SELECT * FROM motorbikes WHERE motorbike_id = ?", n)
     if motorbike.empty
        return nil
      end
    else
      nil
    end
    motorbike
  end

  def self.find_by_name(string)
    #finds instances by name model or brand
    if string.kind_of?(String)
      result = DB.execute("SELECT * FROM motorbikes WHERE motorbike.name_and_brand LIKE = '%string%'")
      if result.empty?
        return nil
      end
    end
    result
  end

  def add (motorbike)
    #adds and updates instances of motorbikes in DB
    DB.execute("INSERT INTO motorbikes ( make_and-model, year) VALUES( ?, ?)", motorbike.make_and_model, motorbike.year)
  end

  def delete (id)
    #deletes an instance based on instance id
    DB.execute("DELETE FROM motorbikes WHERE motorbike_id = ?", id)
  end
  
  