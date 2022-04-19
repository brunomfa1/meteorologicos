//CLASSE DA API

//CLASSE WEATHER
class Weather {
  String? temperature;
  String? wind;
  String? description;
  List<Forecast>? forecast;

  Weather({this.temperature, this.wind, this.description, this.forecast});

  Weather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    wind = json['wind'];
    description = json['description'];
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(new Forecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['wind'] = this.wind;
    data['description'] = this.description;
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//CLASSE FORECAST
class Forecast {
  String? day;
  String? temperature;
  String? wind;

  Forecast({this.day, this.temperature, this.wind});

  Forecast.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    temperature = json['temperature'];
    wind = json['wind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['temperature'] = this.temperature;
    data['wind'] = this.wind;
    return data;
  }
}