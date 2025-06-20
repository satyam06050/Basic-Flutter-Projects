import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pix_wall/fullScreen.dart'; // <-- fixed import here

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];
  int page = 1;

  Future<void> fetchApi() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {'Authorization': dotenv.env['API_KEY'] ?? ''},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        setState(() {
          images = result['photos'];
        });
      } else {
        // Handle non-200 status codes
        print('Failed to fetch images. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e, stackTrace) {
      // Handle network or decoding errors
      print('Error occurred while fetching images: $e');
      print('Stack trace: $stackTrace');
    }
  }

  loadMore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=80&page=' + page.toString();
    await http
        .get(
          Uri.parse(url),
          headers: {'Authorization': dotenv.env['API_KEY'] ?? ' '},
        )
        .then((value) {
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
        });
  }

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Fullscreen(
                          imageurl: images[index]['src']['large2x'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    child: Image.network(
                      images[index]['src']['tiny'],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              loadMore();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text("Load More", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
