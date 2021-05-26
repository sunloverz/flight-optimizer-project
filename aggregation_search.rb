class AggregationSearch
  attr_reader :departure, :destinations, :client, :flight_prices

  def initialize(departure: departure, destinations: destinations, client: RestClient.new)
    @departure = departure
    @destinations = destinations
    @client = client
    @flight_prices = get_flight_prices
  end

  def get_flight_prices
    values = {}
    destinations.each do |destination|
      response = get_price_per_city(destination)
      _, price = response.fetch(:data).first
      values[destination.code] = price
    end
    values
  end

  def get_price_per_city(destination)
    url = "/aggregation_search/price_per_city?fly_from=#{departure.code}&fly_to=#{destination.code}&date_from=01%2F06%2F2021&date_to=07%2F06%2F2021&max_fly_duration=20&flight_type=oneway&adults=1&curr=USD&limit=30"
    client.get(url)
  end
end
