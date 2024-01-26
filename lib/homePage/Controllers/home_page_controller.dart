import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:olly_olly_test/homePage/l10n/home_page_l10n.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../detailsScreen/Pages/weather_details_screen_page.dart';
import '../models/weather_data.dart';

class HomeController {
  double ? latitude;
  double ? longitude;
  late BuildContext context;
  WeatherData ? weatherData;

  final HomePageL10n l10n = HomePageL10n();

  HomeController(this.context);

  Future<void> currentLocation() async {
    final PermissionStatus status = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      final PermissionStatus requestedStatus = await Permission.locationWhenInUse.request();
      if (requestedStatus.isGranted) {
        await getLocation();
      }
    } else if (status.isGranted) {
      await getLocation();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(l10n.alertTitle),
          content:  Text(l10n.alertContent),
          actions: <Widget>[
            TextButton(
              child:  Text(l10n.alertButton),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  Future<void> getLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      print('$error');
    }
  }



  Future<void> fetchWeatherData() async {
    try {
      final String baseUrl = 'https://api.openweathermap.org/data/3.0/onecall';
      final String apiKey = '5d288c9f8179f63f115faedad855041e';

      final String url = '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey';

      final reponse = await Dio().get(url);
      
      if(reponse.statusCode != 200) throw Exception('Error the response was not 200');


      weatherData = WeatherData.fromJson(reponse.data);




    } catch (error) {
      print('$error');
    }
  }
}