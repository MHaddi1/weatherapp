import 'package:get/get.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherController extends GetxController {
  RxString cityName = "".obs;
  RxDouble temperature = 0.0.obs;
  RxString mainCondition = "".obs;

  final WeatherService weatherService =
      WeatherService("Your API");

  Future<void> fetchWeather() async {
    String? cityName = await weatherService.currentCity();
    try {
      final weather = await weatherService.getWeather(cityName);
      this.cityName.value = weather.cityName;
      temperature.value = weather.temperature;
      mainCondition.value = weather.mainCondition;
      print(weather);
    } catch (e) {
      print(e.toString());
    }
  }

  String getAnimations(String? mainCondition) {
    if (mainCondition == null) {
      return "assets/sunny.json";
    }
    switch (mainCondition.toLowerCase()) {
      case "clear":
        return "assets/sunny.json";
      case "clouds":
        return "assets/cloud.json";
      case "rain":
        return "assets/raining.json";
      case "snow":
      //return "assets/snow.json";
      case "thunderstorm":
        return "assets/thunder.json";
      case "fog":
      //return "assets/fog.json";
      default:
        return "assets/sunny.json";
    }
  }
}
