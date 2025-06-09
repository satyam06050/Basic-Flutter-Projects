import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';

class WeatherService {
  final String _apiKey = dotenv.env['WEATHER_API_KEY']!;
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$_baseUrl?q=$cityName&appid=$_apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather: ${response.statusCode}');
    }
  }
}
