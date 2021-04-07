#responsible for making a call to API
#getting the data necessary
#creating new Ruby objects with that data => Object Oriented
class API

    @@key = ENV["GEO_KEY"]

    def self.get_geo_data(city_name)
        geocoder = OpenCage::Geocoder.new(api_key: @@key)
        result = geocoder.geocode(city_name)
        lat = result.first.coordinates[0]
        long = result.first.coordinates[1]
        get_sport_data(lat, long)
    end

    def self.get_sport_data(lat, long)
        response = RestClient.get("https://sports.api.decathlon.com/sports/recommendations/geolocation?coordinates=:coordinates=%22#{long}%22,%22#{lat}%22")
        sports_list = JSON.parse(response)
        sports_list.each do |sport|
            Sport.new(sport["attributes"]["name"], sport["attributes"]["description"])
        end
    end

end