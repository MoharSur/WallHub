import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/views/wallpapers_display_screen.dart';

class WallpapersHolder extends StatelessWidget {
  final String name;
  final String url;
  final int index;
  const WallpapersHolder(
      {Key? key, required this.url, required this.name, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WallpaperDisplayScreen(category: name, categoryIndex: index),
            duration: const Duration(milliseconds: 800),
            transition: Transition.circularReveal,
            curve: Curves.easeIn);
      },
      child: Card(
        color: backgroundColor,
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius)),
        child: Container(
          //padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circularRadius),
              //border: Border.all(color: Colors.red, width: 2.0),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(url), fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.65,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(circularRadius),
                        bottomLeft: Radius.circular(circularRadius))),
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                child:
                    Center(child: Center(child: Text(name, style: textStyle))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
