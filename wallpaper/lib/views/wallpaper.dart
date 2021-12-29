import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/views/wallpaper_change_screen.dart';

class Wallpaper extends StatelessWidget {
  final String url;
  final num id;
  const Wallpaper({Key? key, required this.url, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WallpaperChangeScreen(url: url, id: id));
      },
      child: Card(
        color: backgroundColor,
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius)),
        child: Hero(
          tag: url,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(circularRadius),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(url), fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
