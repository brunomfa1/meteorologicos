import 'dart:convert';

//CLASSE DA API

//CLASSE WEATHER
class Weather {
  String? temperature;
  String? wind;
  String? description;
  List<Forecast>? forecast;

  Weather({this.temperature, this.wind, this.description, this.forecast});

  

  Map<String, dynamic> toMap() {
     return {
    'temperature': temperature,
    'wind': wind,
    'description': description,
    'forecast': forecast!.map((x) => x.toMap()).toList()
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['temperature'],
      wind: map['wind'],
      description: map['description'],
      forecast: map['forecast'] != null ? List<Forecast>.from(map['forecast']?.map((x) => Forecast.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));
}

//CLASSE FORECAST
class Forecast {
  String? day;
  String? temperature;
  String? wind;

  Forecast({this.day, this.temperature, this.wind});



  Map<String, dynamic> toMap() {
   
    return {
      'day': day,
      'temperature': temperature,
      'wind': wind
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      day: map['day'],
      temperature: map['temperature'],
      wind: map['wind'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecast.fromJson(String source) => Forecast.fromMap(json.decode(source));
}
