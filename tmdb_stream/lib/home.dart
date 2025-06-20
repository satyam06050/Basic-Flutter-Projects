import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_stream/functions.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmovies();
  }

  List trendingmovies = [];
  final key = dotenv.env['API_KEY'];
  final accesskey = dotenv.env['AccessToken'];

  Future<void> loadmovies() async {
    final tmdb = TMDB(ApiKeys(key!, accesskey!));
    Map result = await tmdb.v3.movies.getPopular();
    print(await tmdb.v3.movies.getPopular());
    print(result);
    // setState(() {
    //   trendingmovies = result['results'];
    // });
    // print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("data")));
  }
}
