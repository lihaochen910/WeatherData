require( 'Interface/Subject' )
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
--header
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
WeatherData = {
	observers = {},

	temperature,
	humidity,
	pressure,

	setMeasurements,
	measurementsChanged,
}
this = WeatherData
setmetatable( this, Subject() )

--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
--function
--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
function WeatherData:new()
	return this
end

function WeatherData:setMeasurements(temperature, humidity, pressure) 
	this.temperature = temperature
	this.humidity = humidity
	this.pressure = pressure
	WeatherData:measurementsChanged()
end

function WeatherData:measurementsChanged()
 	WeatherData:notifyObserver()
end 

function WeatherData:notifyObserver()
	for i = 1, #this.observers do
		this.observers[i]:Update(this.temperature, this.humidity, this.pressure)
	end
end

function WeatherData:registerObserver(observer)
	table.insert( this.observers, observer ) 
end

function WeatherData:removeObserver(observer)
	table.remove( this.observers, function()
		for i = 1,#this.observers do
			if this.observers[i] == observer then
				return i
			end
		end
	end )
end