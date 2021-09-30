import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/core/navigation/routes.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:last_fm_music_search_app/features/album/shared_presentation/rounded_network_image.dart';

class AlbumListView extends StatelessWidget {
  final List<Album> albums;

  const AlbumListView({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const ValueKey("albumListView"),
        itemBuilder: (_, index) => _buildListTile(index, context),
        separatorBuilder: (_, __) => _buildDivider,
        itemCount: albums.length);
  }

  ListTile _buildListTile(int index, BuildContext context) {
    final album = albums[index];
    return ListTile(
      key: ValueKey("albumListTile$index"),
      leading: RoundedNetworkImage(album.imageUrl),
      title: Text(album.name),
      subtitle: Text(album.artist),
      onTap: () => _navigateToAlbumDetail(context, album),
    );
  }

  Divider get _buildDivider => const Divider(color: Colors.grey, height: 1);

  void _navigateToAlbumDetail(BuildContext context, Album album) {
    Navigator.of(context).pushNamed(Routes.albumDetail, arguments: album);
  }
}
