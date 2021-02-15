class MotorbikesController
  attr_reader :motorbikes_view

  def initialize(attributes = {})
    @motorbikes_view = attributes[:motorbikes_view]
  end
  
  def index
    sleep(0.3)
    array = Motorbike.all
    @motorbikes_view.all(array)
  end
  
  def year
    sleep(0.3)
    anno = @motorbikes_view.get_something('year')
    if anno.kind_of?(NilClass)
      year
    else
      array = Motorbike.find_by_year(anno)
      @motorbikes_view.all(array)
    end
  end 
  
  def brand
    sleep(0.3)
    marca = @motorbikes_view.get_something('brand')
    array = Motorbike.find_by_name(marca)
    if array.kind_of?(NilClass)
      brand
    else
      @motorbikes_view.all(array)
    end
  end

  def drop
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
