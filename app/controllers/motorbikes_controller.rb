require_relative "../models/motorbike.rb"

class MotorbikesController
  attr_reader :motorbikes_view

  def initialize(attributes = {})
    @motorbikes_view = attributes[:motorbikes_view]
  end
  
  def index
    array = Motorbike.all
    @motorbikes_view.all(array)
  end

  def year
    anno = @motorbikes_view.get_something('year')
    if anno.kind_of?(NilClass)
      year
    else
      array = Motorbike.find_by_year(anno)
      @motorbikes_view.all(array)
    end
  end 
    
  def brand
      #list all the bikes by brand or model
      marca = @motorbikes_view.get_something('brand')
      if marca.kind_of?(String)
        array = Motorbike.find_by_name(marca)
        @motorbikes_view.all(array)
      else
        brand
      end
  end
  
  def add
    # add a new bike
  end
  
  def delete
    #delete a bike by id
  end
  

end
