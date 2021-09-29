import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

class DetailedAlbum extends Album {
  final int listeners;
  final int playCount;
  final String firstPublished;
  final String summaryContent;
  final List<Track> trackList;

  const DetailedAlbum({
    required String name,
    required String artist,
    required String imageUrl,
    required this.firstPublished,
    required this.listeners,
    required this.playCount,
    required this.summaryContent,
    required this.trackList,
  }) : super(name, artist, imageUrl);

}
