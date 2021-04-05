#responsible for making a call to API
#getting the data necessary
#creating new Ruby objects with that data => Object Oriented

# require 'opencage/geocoder'
class API

    # geocolder = OpenCage::Geocoder.new(api_key: 'ff81c5511add42cf99eaf5134b0f706f') #ENV["GEO_KEY"]
    # result = geocolder.geocode('Toronto, Canada')
    # puts result.first.coordinates

    @@key = ENV["GEO_KEY"]

     def self.get_data(city)
        response = RestClient.get("https://api.opencagedata.com/geocode/v1/json?q=#{city}%20IL&key=#{@@key}")
        lat = JSON.parse(response)["results"].first["annotations"]["DMS"]["lat"].split(" ")[2].gsub("''", "")
        long = JSON.parse(response)["results"].first["annotations"]["DMS"]["lng"].split(" ")[2].gsub("''", "")
        binding.pry
        get_sports_list(lat, long)
     end

     def self.get_sport_list(lat, long)
        response = RestClient.get("https://sports.api.decathlon.com/sports/recommendations/geolocation?coordinates=#{long},#{lat}")
        sport_list = JSON.parse(response)
        sport_list.each do |sport|
        # binding.pry
        end
    end
    


end