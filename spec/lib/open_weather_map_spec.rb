require 'spec_helper'

describe 'OpenWeatherMap' do

  before do
    url = ENV.fetch('API_ENDPOINT')
    api_key = ENV.fetch('API_KEY')

    @zip_code = 94040

    weather_url = "#{url}?zip=#{@zip_code}&APPID=#{api_key}&units=imperial"

    @response_body = '{"coord":{"lon":-122.09,"lat":37.39},"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50d"}],"base":"stations","main":{"temp":304.55,"pressure":1009,"humidity":65,"temp_min":299.15,"temp_max":310.15},"visibility":14484,"wind":{"speed":1.5,"deg":140},"clouds":{"all":1},"dt":1504290900,"sys":{"type":1,"id":392,"message":0.0045,"country":"US","sunrise":1504273185,"sunset":1504319731},"id":0,"name":"Mountain View","cod":200}'

    stub_request(:get, weather_url).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'api.openweathermap.org', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: @response_body, headers: {})

  end

  it "should initialize with variables from .env" do
    owm = OpenWeatherMap.new
    expect(owm.url).to eq(ENV.fetch('API_ENDPOINT'))
    expect(owm.api_key).to eq(ENV.fetch('API_KEY'))
  end

  it "should return data" do
    owm = OpenWeatherMap.new
    owm.fetch(94040)

    expect(owm.data).to eq(JSON.parse(@response_body))
  end
end
