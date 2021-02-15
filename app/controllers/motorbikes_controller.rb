require "pry-byebug"
require_relative "../models/motorbike.rb"

class MotorbikesController
  attr_reader :motorbikes_view

  def initialize(attributes = {})
    @motorbikes_view = attributes[:motorbikes_view]
  end
  
  def index
    sleep(1)
    array = Motorbike.all
    @motorbikes_view.all(array)
  end
  
  def year
    sleep(1)
    anno = @motorbikes_view.get_something('year')
    if anno.kind_of?(NilClass)
      year
    else
      array = Motorbike.find_by_year(anno)
      @motorbikes_view.all(array)
    end
  end 
  
  def brand
    sleep(1)
    marca = @motorbikes_view.get_something('brand')
    array = Motorbike.find_by_name(marca)
    # binding.pry
    if array.kind_of?(NilClass)
      brand
    else
      @motorbikes_view.all(array)
    end
  end

  def drop
    # binding.pry
    @motorbikes_view.dropping
    sleep(1)
    Motorbike.drop
    @motorbikes_view.farewell
    exit
  end
  
  def add
    # add a new bike
  end
  
  def delete
    #delete a bike by id
  end
  

end
