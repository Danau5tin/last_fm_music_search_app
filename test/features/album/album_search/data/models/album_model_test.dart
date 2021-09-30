import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_image_model.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_model.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

import '../../../../../fixtures/fixture_reader.dart';


void main() {
  test("should extend Album", () async {
    // Arrange
    final jsonMap = _getMapFromJsonFile("album");
    // Act
    final albumModel = AlbumModel.fromJson(jsonMap);
    // Assert
    expect(albumModel, isA<Album>());
  });

  group("fromJson", () {
    test("should return correct album with medium image", () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album");
      // Act
      final albumModel = AlbumModel.fromJson(jsonMap);
      // Assert
      expect(jsonMap["name"], albumModel.name);
      expect(jsonMap["artist"], albumModel.artist);
      expect(jsonMap["image"][2]["#text"], albumModel.imageUrl);
    });

    test("should return correct album with small image as medium is missing",
        () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album_no_medium_image");
      // Act
      final albumModel = AlbumModel.fromJson(jsonMap);
      // Assert
      expect(jsonMap["image"][1]["#text"], albumModel.imageUrl);
    });

    test(
        "should return correct album with default image as empty list of images",
        () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album_no_images");
      // Act
      final albumModel = AlbumModel.fromJson(jsonMap);
      // Assert
      expect(kDefaultAlbumImagePath, albumModel.imageUrl);
    });
  });
}

Map<String, dynamic> _getMapFromJsonFile(String fileName) =>
    json.decode(fixture("album/$fileName.json"));
