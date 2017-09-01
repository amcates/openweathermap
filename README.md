Setup:

* Copy .env.example to .env
* Change API_KEY to reflect your API key for http://openweathermap.org/
* Change ZIP_CODES to reflect the areas you would like weather information for

Usage:

* Install Ruby 2.4.1 (use RVM if desired, .ruby-version and .ruby-gemset included)
* Bundle install
* Run rake db:create and rake db:migrate
* Run rake fetch_weather (this will populate the weather_measurements table with data for the zip codes you have listed in .env)
