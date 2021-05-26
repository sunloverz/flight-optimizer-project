class RestClient
  HEADERS = {accept: 'application/json', apikey: 'fUfVhV-v87mtISxkJPlasopiB3mmosJ1'}.freeze
  BASE_URL = 'https://tequila-api.kiwi.com'

  def get(url)
    uri = URI(BASE_URL + url)
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri, HEADERS)
      response = http.request(request).body
      JSON.parse(response, symbolize_names: true)
    end
  end
end
