// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/views/home_screen.dart';
import 'controllers/wallpaper_controller.dart';
import 'models/api.dart';

void main() {

   // Dependency injection
    Get.put(WallpaperApiModel());
    Get.put(WallpaperController());


  runApp(GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(color: appBarColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()));
}
