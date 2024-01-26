class WeatherData{
  
    final String timezone;
    final double temp;
    final int humidity;
    final double windSpeed;
    final String description;

    WeatherData (this.timezone,  this.temp,  this.humidity,  this.windSpeed,  this.description);

    factory WeatherData.fromJson(Map<String, dynamic> json){
      return WeatherData(json['timezone'], json['current']['temp'], json['current']['humidity'],json['current']['wind_speed'],json['current']['weather'][0]['description'] );
    }

}