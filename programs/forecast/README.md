## Weather forecast
This is a simple weather forecast
The first number is the current temperature and the second one is a 3 hour forecast, the output is fully configurable.

You need Weather Icons and Material Icons for this to work properly. \

### Configuration
Look at the example TOML configuration file.

```toml
# Register at https://openweathermap.org to get your API key
# If you don't want to write your key here, you can delete this line and use the OWM_API_KEY environment variable instead
api_key = "YOUR_API_KEY"

# This is for Montreal, find your city at https://openweathermap.org
# The id will be the last part of the URL
city_id = "6077243"

# Output format, using Handlebars syntax, meaning variables should be used like {{ this }}
# Available tokens are:
# - temp_celcius
# - temp_kelvin
# - temp_fahrenheit
# - temp_icon
# - trend
# - forecast_celcius
# - forecast_kelvin
# - forecast_fahrenheit
# - forecast_icon
display = "{{ temp_icon }} {{ temp_celcius }}°C {{ trend }} {{ forecast_icon }} {{ forecast_celcius }}°C"
```
