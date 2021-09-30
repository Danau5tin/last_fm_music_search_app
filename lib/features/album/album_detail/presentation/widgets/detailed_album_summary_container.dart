import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/widgets/shadowed_container.dart';

import 'expandable_text.dart';
import 'quick_info_row.dart';

class DetailedAlbumSummaryContainer extends StatelessWidget {
  final DetailedAlbum detailedAlbum;

  const DetailedAlbumSummaryContainer(this.detailedAlbum, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedContainer(
      Column(
        children: [
          Text("Release date: ${detailedAlbum.firstPublished ?? "Unknown"}"),
          const SizedBox(height: 8),
          _buildQuickInfoRows,
          if (detailedAlbum.summaryContent != null) ..._buildExpandableSummary()
        ],
      ),
    );
  }

  List<Widget> _buildExpandableSummary() {
    return [
      const SizedBox(height: 16),
      ExpandableText(detailedAlbum.summaryContent!)
    ];
  }

  Row get _buildQuickInfoRows {
    return Row(
      children: [
        QuickInfoRow(
            CupertinoIcons.ear, "Listeners: ${detailedAlbum.listeners}"),
        const Spacer(),
        QuickInfoRow(
            CupertinoIcons.play_arrow, "Plays: ${detailedAlbum.playCount}")
      ],
    );
  }
}
