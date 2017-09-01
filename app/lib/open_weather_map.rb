class OpenWeatherMap
  attr_accessor :url,
                :api_key,
                :data,
                :zip_code,
                :conditions,
                :pressure,
                :temp,
                :wind_speed,
                :wind_degrees,
                :humidity,
                :data_collected_at

  def initialize(url=ENV.fetch('API_ENDPOINT'), api_key=ENV.fetch('API_KEY'))
    @url = url
    @api_key = api_key
  end

  def fetch(zip_code)
    self.zip_code = zip_code

    weather_url = "#{@url}?zip=#{zip_code}&APPID=#{@api_key}&units=imperial"

    begin
      response = Net::HTTP.get_response(URI.parse(weather_url))
      self.data = JSON.parse(response.body)
    rescue
      raise "An error occured communicating with the OpenWeatherMap API"
    end
  end

  def extract_data
    # weather contains multiple entries with main data (haze, smoke)
    weather = self.data["weather"]

    # main contains temp, pressure, humidity
    main = self.data["main"]

    # wind (speed, deg)
    wind = self.data["wind"]

    self.conditions = weather.map{|x| x["main"]}.join(", ")
    self.pressure = main["pressure"]
    self.temp = main["temp"]
    self.wind_speed = wind["speed"]
    self.wind_degrees = wind["deg"]
    self.humidity = main["humidity"]

    self.data_collected_at = self.data["dt"]
  end

end
