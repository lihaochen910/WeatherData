require('WeatherData')
require('CurrentConditionsDisplay')

weatherData = WeatherData:new()

currentDisplay = CurrentConditionsDisplay:new(weatherData)

weatherData:setMeasurements(30,80,30.4)