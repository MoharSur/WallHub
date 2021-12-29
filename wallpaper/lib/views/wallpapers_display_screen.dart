import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/controllers/wallpaper_controller.dart';
import 'package:wallpaper/views/wallpaper.dart';

class WallpaperDisplayScreen extends StatelessWidget {
  final String category;
  final int categoryIndex;
  const WallpaperDisplayScreen(
      {Key? key, required this.category, required this.categoryIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WallpaperController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text(category, style: textStyle),
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
            child: StaggeredGridView.countBuilder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.wallpapers[categoryIndex].length,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  var wallpapers = controller.wallpapers[categoryIndex];
                  return Wallpaper(
                      id: wallpapers[index].id,
                      url: wallpapers[index].url);
                },
                staggeredTileBuilder: (index) {
                  return index.isEven
                      ? const StaggeredTile.count(1, 1.5)
                      : const StaggeredTile.count(1, 1);
                })));
  }
}
