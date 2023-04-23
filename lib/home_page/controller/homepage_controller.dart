import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecontroller extends GetxController {
  var location = "Kottayam".obs;
  var obj = 0.0.obs;
  var season = "".obs;
  var loading = false.obs;

  Future<void> onInit() async {
    super.onInit();
    fetchWeather();
    Timer.periodic(Duration(seconds: 3), (timer) {
      fetchWeather();
    });
  }

  Future<void> startTimer() async {}

  Future<Location> fetchlocation() async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=1&appid={app-id}'));
    if (response.statusCode == 200) {
      return (Location.fromJson(jsonDecode(response.body)));
    } else {
      throw "Failed to load";
    }
  }

  void fetchWeather() async {
    loading.value = true;
    Location latlog = await fetchlocation();
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${latlog.lat}&lon=${latlog.log}&appid={app-id}'));
    if (response.statusCode == 200) {
      obj.value = Weather.fromJson(jsonDecode(response.body)).temp;
      season.value = Weather.fromJson(jsonDecode(response.body)).season;
      print(obj);
    } else {
      throw "Failed to load";
    }
    loading.value = false;
  }
}

class Location {
  final double lat;
  final double log;

  Location({required this.lat, required this.log});

  factory Location.fromJson(List<dynamic> json) {
    return Location(lat: json[0]['lat'], log: json[0]['lon']);
  }
}

class Weather {
  final double temp;
  final String season;

  Weather({required this.temp, required this.season});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json['main']['temp'], season: json["weather"][0]["main"]);
  }
}
