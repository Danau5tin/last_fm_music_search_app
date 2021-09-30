import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';
import 'package:last_fm_music_search_app/features/album/shared_presentation/rounded_network_image.dart';

import 'shadowed_container.dart';

class AlbumTrackListContainer extends StatelessWidget {
  final List<Track> trackList;
  final String imageUrl;
  final ScrollController? scrollController;

  const AlbumTrackListContainer(this.trackList, this.imageUrl,
      {Key? key, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedContainer(Column(

      children: [
        Text("Track list", style: Theme.of(context).textTheme.headline6),
        ListView.builder(
          controller: scrollController,
          key: const ValueKey("albumTrackList"),
          shrinkWrap: true,
          itemCount: trackList.length,
          itemBuilder: (context, index) {
            final track = trackList[index];
            return ListTile(
              leading: RoundedNetworkImage(imageUrl),
              title: Text(track.name),
              subtitle: Text(track.readableDuration),
            );
          },
        ),
      ],
    ));
  }
}
