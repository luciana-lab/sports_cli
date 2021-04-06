#responsible for making a call to API
#getting the data necessary
#creating new Ruby objects with that data => Object Oriented
class API

    # geocolder = OpenCage::Geocoder.new(api_key: 'ff81c5511add42cf99eaf5134b0f706f') #ENV["GEO_KEY"]
    # geocolder = OpenCage::Geocoder.new(api_key: @@key)
    # result = geocolder.geocode('Toronto, Canada')
    # puts result.first.coordinates

    @@key = ENV["GEO_KEY"]

    def self.get_data(city)
        geocolder = OpenCage::Geocoder.new(api_key: @@key)
        result = geocolder.geocode(city)
        lat = result.first.coordinates[0]
        long = result.first.coordinates[1]
        get_sport_data(lat, long)
    end
        # response = RestClient.get("https://api.opencagedata.com/geocode/v1/json?q=#{city}%20IL&key=#{@@key}")
        # lat = JSON.parse(response)["results"].first["annotations"]["DMS"]["lat"].split(" ")[2].gsub("''", "")
        # long = JSON.parse(response)["results"].first["annotations"]["DMS"]["lng"].split(" ")[2].gsub("''", "")
     

    def self.get_sport_data(lat, long)
        response = RestClient.get("https://sports.api.decathlon.com/sports/recommendations/geolocation?coordinates=:coordinates=%22#{long}%22,%22#{lat}%22")
        sports_list = JSON.parse(response)
        sports_list.each do |sport|
            Sport.new(sport["attributes"]["name"], sport["attributes"]["description"])
        end
    end
    
end