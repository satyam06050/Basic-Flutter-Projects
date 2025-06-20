import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//import 'package:pix_wall/wallpaper.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class Fullscreen extends StatefulWidget {
  final String imageurl;

  const Fullscreen({super.key, required this.imageurl});

  @override
  _FullscreenState createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  Future<void> setWallpaper() async {
    try {
      final wallpaperManager = WallpaperManagerFlutter();

      int location = WallpaperManagerFlutter.bothScreens;
      var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
      bool result = await wallpaperManager.setWallpaper(file, location);
      if (result) {
        print('Wallpaper set successfully! 🎉');
      }
    } catch (e) {
      print('Error setting wallpaper: $e ❌');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(child: Image.network(widget.imageurl))),
            InkWell(
              onTap: () async {
                setWallpaper();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Set Wallpaper",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
