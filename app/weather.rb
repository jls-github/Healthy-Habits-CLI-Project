class Weather

    def self.api_request(city)
        url = URI("https://community-open-weather-map.p.rapidapi.com/weather?callback=test&id=2172797&units=%2522metric%2522%20or%20%2522imperial%2522&mode=xml%252C%20html&q=#{city.capitalize}")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'
        request["x-rapidapi-key"] = '7579a91691mshdeb705669a5f73ap16b7ebjsn7ebba2669f96'
        
        response = http.request(request)
        hash = JSON.parse(response.read_body.split("test")[1].split("(")[1].split(")")[0])
    end

    def self.weather_hash(city)
        weather_info = self.api_request(city)
        hash = {}
        hash["weather_description"] = weather_info["weather"][0]["description"].split(/ |\_|\-/).map(&:capitalize).join(" ")
        hash["min_temperature"] = kelvin_to_fahrenheit(weather_info["main"]["temp_min"]).round
        hash["max_temperature"] = kelvin_to_fahrenheit(weather_info["main"]["temp_max"]).round
        hash["temp_feels_like"] = kelvin_to_fahrenheit(weather_info["main"]["feels_like"]).round
        hash
    end

    def self.kelvin_to_fahrenheit(kelvin)
        ((kelvin - 273.15) * 9 / 5) + 32
    end

    def self.display_weather(city)
        weather_details = self.weather_hash(city)
        puts "-------------------"
        puts "Weather for #{city}"
        puts "-------------------"
        puts "Condition: #{weather_details["weather_description"]}"
        puts "Minimum Temperature: #{weather_details["min_temperature"]}•F"
        puts "Maximum Temperature: #{weather_details["max_temperature"]}•F"
        puts "Feels Like: #{weather_details["temp_feels_like"]}•F"
        puts "-------------------"
    end

end
