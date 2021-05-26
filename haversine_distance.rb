class HaversineDistance
  attr_reader :departure, :destination, :distance

  def initialize(departure, destination)
    @departure = departure
    @destination = destination
    @distance = calculate_distance
  end

  def calculate_distance(miles=false)
    # Get latitude and longitude
    lat1, lon1 = departure.lat, departure.lon
    lat2, lon2 = destination.lat, destination.lon

    # Calculate radial arcs for latitude and longitude
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180

    a = Math.sin(dLat / 2) *
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) *
            Math.cos(lat2 * Math::PI / 180) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    d = 6371 * c * (miles ? 1 / 1.6 : 1)
  end
end
