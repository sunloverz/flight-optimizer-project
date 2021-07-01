class DestinationPriceIterator
  attr_reader :collection
  MAX = 10000000.0

  def initialize(collection: [])
    @collection = collection
  end

  def add_item(item)
    collection << item
  end

  def <<(item)
    collection << item
  end

  def find_min_price
    min, city = MAX, ''
    collection.each do |item|
      if item.dollars_per_km < min
        min = item.dollars_per_km
        city = item.city_name
      end
    end
    [min, city]
  end
end
