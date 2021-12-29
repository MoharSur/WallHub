class WallpaperModel {
  num id;
  String url;
  WallpaperModel(this.id, this.url);

  num get wallpaperID => id;
  String get wallpaperURL => url;

  WallpaperModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        url = map['src']['large2x'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }

  @override
  String toString() {
    return '$id - $url';
  }
}
