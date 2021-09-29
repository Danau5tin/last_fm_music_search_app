import 'package:last_fm_music_search_app/features/album/album_detail/data/models/track_model.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_image_model.dart';

class DetailedAlbumModel extends DetailedAlbum {
  const DetailedAlbumModel({
    required String name,
    required String artist,
    required String imageUrl,
    required String firstPublished,
    required int listeners,
    required int playCount,
    required String summaryContent,
    required List<Track> trackList,
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
    final String imageUrl =
        AlbumImageModel.getSpecificImageUrlFromList(albumMap['image']);
    final List<TrackModel> trackList = List<TrackModel>.from(albumMap['tracks']
            ['track']
        .map((trackJson) => TrackModel.fromJson(trackJson)));

    return DetailedAlbumModel(
        name: albumMap['name'],
        artist: albumMap['artist'],
        imageUrl: imageUrl,
        firstPublished: wikiMap['published'],
        listeners: int.parse(albumMap['listeners']),
        playCount: int.parse(albumMap['playcount']),
        summaryContent: wikiMap['summary'],
        trackList: trackList);
  }
}
