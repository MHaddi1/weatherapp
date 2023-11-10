import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final WeatherController weatherController = Get.put(WeatherController());
  @override
  void initState() {
    super.initState();
    weatherController.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.9),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: VStack([
          const Icon(
            Icons.place,
            color: Colors.white,
            size: 30,
          ).centered(),
          10.heightBox,
          Obx(() {
            return weatherController.cityName.value.text.bold
                .color(Colors.white)
                .xl3
                .makeCentered();
          }),
          Obx(() {
            return Lottie.asset(weatherController
                    .getAnimations(weatherController.mainCondition.value))
                .centered();
          }),
          Obx(() {
            return Text(
              '${weatherController.temperature.round()} °C',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ).centered();
          }),
          20.heightBox,
          Obx(() {
            return Text(
              weatherController.mainCondition.value,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ).centered();
          }),
        ]).centered(),
      ),
    );
  }
}
