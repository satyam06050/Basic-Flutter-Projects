import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> fetchData() async {
    final key = dotenv.env["API_KEY"];
    final accesstoken = dotenv.env["AccessToken"];
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/11',
        queryParameters: {'api_key': key},
      );
      print(response.data);
    } catch (e) {
      print('❌ Error: $e');
    }
  }
}
