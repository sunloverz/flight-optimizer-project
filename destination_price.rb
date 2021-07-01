class DestinationPrice
  attr_reader :dollars_per_km, :price, :city_name

  def initialize(dollars_per_km:, price:, city_name:)
    @dollars_per_km = dollars_per_km
    @price = price
    @city_name = city_name
  end
end
