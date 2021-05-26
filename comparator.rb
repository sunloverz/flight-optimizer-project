class Comparator
  attr_reader :flight_prices, :departure, :destinations
  Destination = Struct.new(:dollars_per_km, :price, :city_name)
  MAX = 10000000.0

  def initialize(departure:, destinations:, flight_prices:)
    @flight_prices = flight_prices
    @departure = departure
    @destinations = destinations
  end

  def result
    min_dollars_per_km, city_name = find_min_price_with_city
    puts city_name
    puts "$#{min_dollars_per_km.round(3)}/km"
  end

  def find_min_price_with_city
    min, city = MAX, ''
    destination_list.each do |destination|
      if destination.dollars_per_km < min
        min = destination.dollars_per_km
        city = destination.city_name
      end
    end
    [min, city]
  end

  def destination_list
    destinations.map do |destination|
      distance = haversine_distance(destination)
      price = flight_prices[destination.code]
      Destination.new(price/distance, price, destination.name)
    end
  end

  def haversine_distance(destination)
    HaversineDistance.new(departure, destination).distance
  end
end
