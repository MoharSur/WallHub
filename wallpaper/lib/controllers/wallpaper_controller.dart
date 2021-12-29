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
    wallpapers.value = await Future.wait(wallpaperCategories
        .map((category) => api.getWallpapers(category, wallpapersPerCategory)));
  }
}
