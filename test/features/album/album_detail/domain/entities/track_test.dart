import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/track.dart';
import 'package:mocktail/mocktail.dart';

class TrackMock extends Mock implements Track {}

void main() {
  late Track track;

  group("readableDuration", () {
    test("should return 2:00 with 120 seconds", () async {
      // Arrange
      track = Track("", "", const Duration(seconds: 120));
      // Act
      final result = track.readableDuration;
      // Assert
      expect(result, "2:00");
    });
    test("should return 2:01 with 121 seconds", () async {
      // Arrange
      track = Track("", "", const Duration(seconds: 121));
      // Act
      final result = track.readableDuration;
      // Assert
      expect(result, "2:01");
    });
    test("should return 1:59 with 119 seconds", () async {
      // Arrange
      track = Track("", "", const Duration(seconds: 119));
      // Act
      final result = track.readableDuration;
      // Assert
      expect(result, "1:59");
    });
  });
}
