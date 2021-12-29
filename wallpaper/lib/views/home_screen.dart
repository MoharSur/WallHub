import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/controllers/wallpaper_controller.dart';
import 'package:wallpaper/views/wallpapers_holder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.settings, color: textColor),
            //   onPressed: () {},
            // ),
            title: RichText(
                text: TextSpan(children: [
              TextSpan(text: 'Wall ', style: textStyle.copyWith(fontSize: 21)),
              WidgetSpan(
                  child: SizedBox(
                      height: kToolbarHeight * 0.50,
                      width: 2.0,
                      child: Container(color: Colors.pink[400]))),
              TextSpan(
                  text: ' Hub',
                  style:
                      textStyle.copyWith(color: Colors.pink[400], fontSize: 21))
            ])),
            centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetX<WallpaperController>(builder: (controller) {
            if (controller.wallpapers.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
                // physics: const BouncingScrollPhysics(),
                itemCount: controller.wallpapers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0),
                itemBuilder: (context, index) {
                  return WallpapersHolder(
                    index: index,
                    name: wallpaperCategories[index],
                    url: controller.wallpapers[index].first
                        .url, // first wallpaper in each of the categories
                  );
                });
          }),
        ));
  }
}
