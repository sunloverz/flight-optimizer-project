class City
  attr_reader :client, :name, :code, :lat, :lon

  def initialize(name:, client: RestClient.new)
    @name = name
    @client = client
    city = get_city
    @code = city.fetch(:code)
    @lat = city.fetch(:location).fetch(:lat)
    @lon = city.fetch(:location).fetch(:lon)
  end

  def get_city
    response = client.get("/locations/query?term=#{name}&locale=en-US&location_types=city&limit=10&active_only=true")
    response.fetch(:locations).first
  end
end
