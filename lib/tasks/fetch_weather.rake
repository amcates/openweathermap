require 'dotenv/tasks'

task :fetch_weather => :environment do
  zip_codes = ENV.fetch('ZIP_CODES')

  zip_codes.split(',').each do |zip_code|
    owm = OpenWeatherMap.new
    owm.fetch(zip_code)
    owm.extract_data

    #<WeatherMeasurement id: nil, zip_code: nil, conditions: nil, pressure: nil, temp: nil, wind_speed: nil, wind_degrees: nil, humidity: nil, data_collected_at: nil, created_at: nil, updated_at: nil>
    wm = WeatherMeasurement.where(zip_code: zip_code).first_or_initialize(zip_code: zip_code)
    wm.conditions = owm.conditions
    wm.pressure = owm.pressure
    wm.temp = owm.temp
    wm.wind_speed = owm.wind_speed
    wm.wind_degrees = owm.wind_degrees
    wm.humidity = owm.humidity
    wm.data_collected_at = owm.data_collected_at

    wm.save
  end
end
