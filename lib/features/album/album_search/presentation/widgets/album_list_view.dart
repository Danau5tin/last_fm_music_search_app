import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

class AlbumListView extends StatelessWidget {
  final List<Album> albums;
  const AlbumListView({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, index) {
          final album = albums[index];
          return ListTile(
            leading: Hero(
                tag: album.imageUrl,
                child: Image.network(album.imageUrl)),
            title: Text(album.name),
            subtitle: Text(album.artist),
          );
        },
        separatorBuilder: (context, index) =>
        const Divider(color: Colors.grey, height: 1),
        itemCount: albums.length);
  }
}
