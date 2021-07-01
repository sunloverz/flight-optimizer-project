class Comparator
  attr_reader :flight_prices, :departure, :destinations
  attr_reader :flight_price_iterator, :destination_price_iterator

  def initialize(departure:, destinations:, flight_price_iterator:, destination_price_iterator:)
    @flight_price_iterator = flight_price_iterator
    @destination_price_iterator = destination_price_iterator
    @departure = departure
    @destinations = destinations
  end

  def result
    min_dollars_per_km, city_name = find_min_price_with_city
    puts city_name
    puts "$#{min_dollars_per_km.round(3)}/km"
  end

  private

  def find_min_price_with_city
    destination_price_iterator.find_min_price
  end

  def destination_list
    destinations.map do |destination|
      distance = haversine_distance(destination)
      price = flight_price_iterator.find_by_code(destination.code).price
      destination_price_iterator << DestinationPrice.new(dollars_per_km: price/distance,
                                                         price: price,
                                                         city_name: destination.name)
    end
  end

  def haversine_distance(destination)
    HaversineDistance.new(departure, destination).distance
  end
end
