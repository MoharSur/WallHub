import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:wallpaper/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wallpaper_manager/wallpaper_manager.dart';

class WallpaperChangeScreen extends StatelessWidget {
  final String url;
  final num id;
  const WallpaperChangeScreen({Key? key, required this.url, required this.id})
      : super(key: key);

  Future<void> changeWallpaper() async {
    int wallpaperLocation = WallpaperManager.HOME_SCREEN;

    // holds reference of the image file
    var file = await DefaultCacheManager().getSingleFile(url);

    try {
      WallpaperManager.setWallpaperFromFile(file.path, wallpaperLocation);

      Get.rawSnackbar(message: 'Wallpaper changed succesfully...');
    } catch (e) {
      Get.rawSnackbar(message: 'Failed to change wallpaper');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Nature', style: textStyle),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(circularRadius)),
                elevation: cardElevation,
                child: Hero(
                  tag: url,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(circularRadius),
                      child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          width: double.infinity)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                      foregroundColor: MaterialStateProperty.all(textColor),
                      backgroundColor: MaterialStateProperty.all(buttonColor),
                    ),
                    onPressed: () {
                      changeWallpaper();
                    },
                    child: const Text('Set Wallpaper')),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
