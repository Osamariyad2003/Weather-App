class Weather {
  late String cityName;
  late String main;
  late double temp;
  late double temp_max;
  late double humidity;
  late double speed;
  late String mainConditions;
  late String description;

  Weather({
    required this.cityName,
    required this.main,
    required this.temp,
    required this.temp_max,
    required this.mainConditions,
    required this.humidity,
    required this.speed,
    required this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    main = json['weather'][0]['main'];
    temp = (json['main']['temp'] as num).toDouble() - 273.15;
    temp_max = (json['main']['temp_max'] as num).toDouble() - 273.15;
    mainConditions = json['weather'][0]['icon'];
    description = json['weather'][0]['description'];
    humidity = (json['main']['humidity'] as num).toDouble();
    speed = (json['wind']['speed'] as num).toDouble();
  }
}



