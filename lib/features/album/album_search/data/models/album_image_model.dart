import 'package:flutter/foundation.dart';

const kDefaultAlbumImagePath =
    "https://static.tumblr.com/jn9hrij/20Ul2zzsr/albumart.jpg";

class AlbumImageModel {
  final String url;
  final AlbumImageModelSize size;

  AlbumImageModel(this.url, this.size);

  static String getSpecificImageUrlFromList(List<dynamic> listOfMaps,
      [AlbumImageModelSize sizeToMatch = AlbumImageModelSize.medium]) {
    try {
      final List<AlbumImageModel> listOfImages = List<AlbumImageModel>.from(
        listOfMaps.map((imageJson) => AlbumImageModel.fromJson(imageJson)),
      );
      if (listOfImages.isEmpty) {
        return kDefaultAlbumImagePath;
      }
      return listOfImages
          .firstWhere((element) => element.size == sizeToMatch,
              orElse: () => listOfImages.first)
          .url;
    } catch (_) {
      return kDefaultAlbumImagePath;
    }
  }

  factory AlbumImageModel.fromJson(Map<String, dynamic> json) {
    final size = AlbumImageModelSize.values.firstWhere(
        (element) => describeEnum(element) == json["size"],
        orElse: () => AlbumImageModelSize.small);
    return AlbumImageModel(json["#text"], size);
  }
}

enum AlbumImageModelSize { small, medium, large, extralarge }
