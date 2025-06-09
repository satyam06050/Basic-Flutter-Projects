import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

final weatherServiceProvider = Provider((ref) => WeatherService());

final weatherProvider =
    StateNotifierProvider<WeatherNotifier, AsyncValue<Weather>>(
        (ref) => WeatherNotifier(ref.read(weatherServiceProvider)));

class WeatherNotifier extends StateNotifier<AsyncValue<Weather>> {
  final WeatherService _weatherService;
  WeatherNotifier(this._weatherService) : super(const AsyncValue.loading());

  Future<void> fetchWeather(String city) async {
    state = const AsyncValue.loading();
    try {
      final weather = await _weatherService.getWeather(city);
      state = AsyncValue.data(weather);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
