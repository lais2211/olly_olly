import 'package:flutter/material.dart';
import 'package:olly_olly_test/detailsScreen/l10n/details_screen_page_l10n.dart';
import 'package:olly_olly_test/homePage/models/weather_data.dart';

class WeatherDetailsScreenPage extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherDetailsScreenPage({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    

    final DetailsScreenPageL10n l10n = DetailsScreenPageL10n();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Timezone: ${weatherData.timezone}',
              style: TextStyle(fontSize: 20,  color: Colors.white,),
            ),
            Text(
              'Temperature: ${weatherData.temp}',
              style: TextStyle(fontSize: 20,  color: Colors.white,),
            ),
            Text(
              'Humidity: ${weatherData.humidity}',
              style: TextStyle(fontSize: 20,  color: Colors.white,),
            ),
            Text(
              'Wind Speed: ${weatherData.windSpeed}',
              style: TextStyle(fontSize: 20,  color: Colors.white,),
            ),
            Text(
              'Description:${weatherData.description}',
              style: TextStyle(fontSize: 20,  color: Colors.white,),
            ),
           
          ],
        ),
      ),
    );
  }
}