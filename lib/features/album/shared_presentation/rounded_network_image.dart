import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_image_model.dart';

class RoundedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const RoundedNetworkImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          errorBuilder: (_, __, ___) =>
              Image.network(kDefaultAlbumImagePath),
        ));
  }
}
