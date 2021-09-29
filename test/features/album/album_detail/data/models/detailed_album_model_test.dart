import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/detailed_album_model.dart';
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
      expect(result.trackList.first, isA<Track>());
      expect(result.listeners, int.parse(jsonMap['album']['listeners']));
    });
  });
}
