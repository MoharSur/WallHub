import 'package:get/get.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/models/api.dart';
import 'package:wallpaper/models/wallpaper_model.dart';

class WallpaperController extends GetxController {
  // BuildContext context;
  // WallpaperController(this.context);

  var wallpapers = <List<WallpaperModel>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWallpapers(wallpapersPerCategory);
  }

  void fetchWallpapers(int quantity) async {
    WallpaperApiModel api = Get.find<WallpaperApiModel>();

    wallpapers.value = await Future.wait({
     // wallpaperCategories.map((e) => api.getWallpapers(e, wallpapersPerCategory))
      api.getWallpapers(wallpaperCategories[0], quantity),
      api.getWallpapers(wallpaperCategories[1], quantity),
      api.getWallpapers(wallpaperCategories[2], quantity),
      api.getWallpapers(wallpaperCategories[3], quantity),
      api.getWallpapers(wallpaperCategories[4], quantity),
      api.getWallpapers(wallpaperCategories[5], quantity),
      api.getWallpapers(wallpaperCategories[6], quantity),
      api.getWallpapers(wallpaperCategories[7], quantity),
      api.getWallpapers(wallpaperCategories[8], quantity),
      api.getWallpapers(wallpaperCategories[9], quantity),
      api.getWallpapers(wallpaperCategories[10], quantity),
      api.getWallpapers(wallpaperCategories[11], quantity),
  });
    // () async {
    //   for (var categoryWallpapers in wallpapers) {
    //     for (var wallpaper in categoryWallpapers) {
    //       precacheImage(NetworkImage(wallpaper.url), context);
    //     }
    //   }
    // };
  }
}
