import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/track_model.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {

  group("fromJson", () {
    test("should return track from json", () async {
      // Arrange
      final jsonMap = json.decode(fixture("/album_detail/track.json"));
      // Act
      final result = TrackModel.fromJson(jsonMap);
      // Assert
      expect(result, isA<TrackModel>());
      expect(result.name, jsonMap["name"]);
      expect(result.duration.inSeconds, jsonMap["duration"]);
    });
  });
}