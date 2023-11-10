class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  // Map<String, dynamic> toJson() {
  //   return {
  //     'cityName': cityName,
  //     'temperature': temperature,
  //     'mainCondition': mainCondition,
  //   };
  // }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
