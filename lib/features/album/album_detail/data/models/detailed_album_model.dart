import 'package:html/parser.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/track_model.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_image_model.dart';

class DetailedAlbumModel extends DetailedAlbum {
  const DetailedAlbumModel({
    required String name,
    required String artist,
    required String imageUrl,
    required String? firstPublished,
    required int listeners,
    required int playCount,
    required String? summaryContent,
    required List<Track>? trackList,
  }) : super(
            artist: artist,
            firstPublished: firstPublished,
            imageUrl: imageUrl,
            listeners: listeners,
            name: name,
            playCount: playCount,
            summaryContent: summaryContent,
            trackList: trackList);

  factory DetailedAlbumModel.fromJson(Map<String, dynamic> json) {
    final albumMap = json["album"];
    final wikiMap = albumMap['wiki'];
    String? summary;
    String? firstPublished;
    if (wikiMap != null) {
      firstPublished = wikiMap['published'];
      summary = _parseHtmlString(wikiMap['summary']);
    }

    List<TrackModel>? trackList;
    final tracksMap = albumMap['tracks'];
    if (tracksMap != null) {
      final tracks = tracksMap['track'];
      if (tracks is List<dynamic>) {
        trackList = List<TrackModel>.from(
            tracks.map((trackJson) => TrackModel.fromJson(trackJson)));
      } else if (tracks is Map<String, dynamic>) {
        trackList = [TrackModel.fromJson(tracks)];
      }
    }

    final String imageUrl =
        AlbumImageModel.getSpecificImageUrlFromList(albumMap['image']);
    return DetailedAlbumModel(
        name: albumMap['name'],
        artist: albumMap['artist'],
        imageUrl: imageUrl,
        firstPublished: firstPublished,
        listeners: int.parse(albumMap['listeners']),
        playCount: int.parse(albumMap['playcount']),
        summaryContent: summary,
        trackList: trackList);
  }

  static String _parseHtmlString(String htmlString) {
    try {
      final document = parse(htmlString);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;
      return parsedString;
    } catch (_) {
      return htmlString;
    }
  }
}
