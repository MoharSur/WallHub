import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:wallpaper/models/wallpaper_model.dart';

class WallpaperApiModel {
  final String _baseURL = 'https://api.pexels.com/v1';
  final String _apiKey =
      '563492ad6f9170000100000112dd060bc39b4aaea8159b1ed2519692';

  // returns a list of wallpapers based on a specific category
  Future<List<WallpaperModel>> getWallpapers(
      String category, int quantity) async {

    // url endpoint of api
    String url = '$_baseURL/search?query=$category&per_page=$quantity';
    
    try {
      var response =
          await get(Uri.parse(url), headers: {'Authorization': _apiKey});

      if (response.statusCode == 200) {
    
        // parsing of the fetched data
        Map<String, dynamic> map = jsonDecode(response.body);
        List<WallpaperModel> wallpapers = _parse(map);
        return wallpapers;
      }
    } catch (e) {
      
      // if failed return empty list
      Get.rawSnackbar(message: 'Check your internet connection...');
      
      return [];
    }
    return [];
  }

  List<WallpaperModel> _parse(Map<String, dynamic> map) {
    // list of wallpapers in json format
    var wallpapersJson = map['photos'] as List<dynamic>;

    // contains all the wallpapers model
    List<WallpaperModel> wallpapers = [];

    for (int i = 0; i < wallpapersJson.length; i++) {
      // gets each of the wallpaper in json format
      var wallpaperJson = wallpapersJson[i];

      // parses the json wallpaper data to a wallaper model
      var wallpaper = WallpaperModel.fromJson(wallpaperJson);

      // adds the model to the list
      wallpapers.add(wallpaper);
    }
    return wallpapers;
  }
}
