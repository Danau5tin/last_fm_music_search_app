import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/widgets/album_track_list_container.dart';
import 'package:last_fm_music_search_app/features/album/shared_presentation/rounded_network_image.dart';

import 'detailed_album_summary_container.dart';

class AlbumDetailBody extends StatefulWidget {
  final DetailedAlbum detailedAlbum;

  const AlbumDetailBody(this.detailedAlbum, {Key? key}) : super(key: key);

  @override
  State<AlbumDetailBody> createState() => _AlbumDetailBodyState();
}

class _AlbumDetailBodyState extends State<AlbumDetailBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey("albumDetailBody"),
      controller: _scrollController,
      child: Column(
        children: [
          const SizedBox(height: 8),
          RoundedNetworkImage(widget.detailedAlbum.imageUrl),
          const SizedBox(height: 8),
          Text(
            "${widget.detailedAlbum.name} by ${widget.detailedAlbum.artist}",
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          DetailedAlbumSummaryContainer(widget.detailedAlbum),
          if (widget.detailedAlbum.trackList != null)
            AlbumTrackListContainer(
              widget.detailedAlbum.trackList!,
              widget.detailedAlbum.imageUrl,
              scrollController: _scrollController,
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
