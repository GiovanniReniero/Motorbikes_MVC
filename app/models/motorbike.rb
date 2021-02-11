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
  end

  def self.find_by_name(string)
    #finds instances by name model or brand
  end

  def add (motorbike)
    #adds and updates instances of motorbikes in DB
  end

  def delete (id)
    #deletes an instance based on instance id
  end
  
  