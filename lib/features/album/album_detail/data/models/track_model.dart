import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';

class TrackModel extends Track {
  TrackModel(String name, String artistName, Duration duration)
      : super(name, artistName, duration);

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    final artistName = json["artist"]["name"];
    final name = json["name"];
    final duration = Duration(seconds: json["duration"]);
    return TrackModel(name, artistName, duration);
  }
}
