class Hours {


  List<ListHours>? list;

  Hours({ this.list});

  Hours.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListHours>[] ;
      json['list'].forEach((v) { list!.add( ListHours.fromJson(v)); });
    }
  }

}

class ListHours {
  DateTime? dt;
  String? cityName;
  double? temp;
  double? humidity;
  double? speed;
  String? mainConditions;

  ListHours({
    required this.cityName,
    required this.temp,
    required this.mainConditions,
    required this.humidity,
    required this.speed,
  });

  ListHours.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = (json['main']['temp'] as num).toDouble() - 273.15;
    mainConditions = json['weather'][0]['icon'];
    humidity = (json['main']['humidity'] as num).toDouble();
    speed = (json['wind']['speed'] as num).toDouble();
    dt = DateTime.parse(json['dt_txt']);
  }
}

