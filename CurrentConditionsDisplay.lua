require('Object-oriented/extend')

require('Interface/Observer')
require('Interface/DisplayElement')
require('WeatherData')
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
--header
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
CurrentConditionsDisplay = {

	weatherData,

	temperature,
	humidity,

}
local this

--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
--function
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
function CurrentConditionsDisplay:new(weatherData)
	--继承多个表
	this = implements(Observer,DisplayElement,CurrentConditionsDisplay)

	this:test()

	this.weatherData = weatherData
	this.weatherData:registerObserver(this)

	return this
end

function CurrentConditionsDisplay:Update(temperature, humidity, pressure)
	this.temperature = temperature
	this.humidity = humidity
	this:display()
end

function CurrentConditionsDisplay:display()
	print('temperature:'..this.temperature)
	print('humidity:'..this.humidity)
end