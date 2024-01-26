import 'package:flutter/material.dart';
import 'package:olly_olly_test/homePage/l10n/home_page_l10n.dart';
import 'package:olly_olly_test/widgets/button_login_page.dart';
import '../../detailsScreen/Pages/weather_details_screen_page.dart';
import '../Controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  late HomeController _homeController;
  final HomePageL10n l10n = HomePageL10n();

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context);
    _homeController.currentLocation();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width, 
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
           [
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ButtonLoginPage(
                text: l10n.buttonLoginPage,
                  onPressed: () {

                     _homeController.fetchWeatherData().then((value) {
                      if(_homeController.weatherData != null){
 Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherDetailsScreenPage(weatherData: _homeController.weatherData!),
        ),
      );
                      }
                      print('Weather data is null, cant redirect');
                     });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

 

}