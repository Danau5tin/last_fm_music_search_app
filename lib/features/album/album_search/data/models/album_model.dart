import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

import 'album_image_model.dart';

class AlbumModel extends Album {
  const AlbumModel({
    required String name,
    required String artist,
    required String imageUrl,
  }) : super(name, artist, imageUrl);

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    final String imageUrl =
        AlbumImageModel.getSpecificImageUrlFromList(json['image']);
    return AlbumModel(
      name: json["name"],
      artist: json["artist"],
      imageUrl: imageUrl,
    );
  }
}
