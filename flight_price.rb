class FlightPrice
  attr_reader :city, :code, :price, :name

  def initialize(city:, price:)
    @city = city
    @price = price
    @code = city.code
    @name = city.name
  end
end
