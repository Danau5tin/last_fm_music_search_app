import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/detailed_album_model.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/track_model.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    test("should return valid AlbumModel", () async {
      // Arrange
      final jsonMap =
          json.decode(fixture("album_detail/album_detail_result.json"));
      // Act
      final result = DetailedAlbumModel.fromJson(jsonMap);
      // Assert
      expect(result, isA<DetailedAlbumModel>());
      expect(result.trackList!.first, isA<Track>());
      expect(result.listeners, int.parse(jsonMap['album']['listeners']));
    });

    test("should remove all html from summary when exists", () async {
      // Arrange
      final jsonMap =
          json.decode(fixture("album_detail/album_detail_result.json"));
      // Act
      final result = DetailedAlbumModel.fromJson(jsonMap);
      // Assert
      expect(result.summaryContent!.contains("<a"), false);
      expect(result.summaryContent!.contains("href"), false);
      expect(result.summaryContent!.contains("</a>"), false);
      expect(result.summaryContent!.contains(">"), false);
    });

    test("should return null wiki data when wiki does not exist", () async {
      // Arrange
      final jsonMap = json.decode(
          fixture("album_detail/album_detail_result_no_wiki_no_tracks.json"));
      // Act
      final result = DetailedAlbumModel.fromJson(jsonMap);
      // Assert
      expect(result.summaryContent, null);
      expect(result.firstPublished, null);
    });

    test("should return null trackList when tracks does not exist", () async {
      // Arrange
      final jsonMap = json.decode(
          fixture("album_detail/album_detail_result_no_wiki_no_tracks.json"));
      // Act
      final result = DetailedAlbumModel.fromJson(jsonMap);
      // Assert
      expect(result.trackList, null);
    });

    test("should return trackList when 1 single track in result", () async {
      // Arrange
      final jsonMap = json.decode(
          fixture("album_detail/album_detail_result_one_track.json"));
      // Act
      final result = DetailedAlbumModel.fromJson(jsonMap);
      // Assert
      expect(result.trackList, isA<List<TrackModel>>());
    });
  });
}
