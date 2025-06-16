import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/providers/weather_provider.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load default city on startup
    ref.read(weatherProvider.notifier).fetchWeather('ranchi');
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref
                  .read(weatherProvider.notifier)
                  .fetchWeather(_cityController.text),
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 32),
            weatherState.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, _) => Text('Error: $err',
                  style: const TextStyle(color: Colors.red)),
              data: (weather) => Column(
                children: [
                  Text(weather.cityName,
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text('${weather.temperature}°C',
                      style: Theme.of(context).textTheme.displayMedium),
                  Text(weather.description),
                  Image.network(
                      'https://openweathermap.org/img/wn/${weather.iconCode}@2x.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
