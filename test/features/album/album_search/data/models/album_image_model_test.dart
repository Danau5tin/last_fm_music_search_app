import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_image_model.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    test("should return correct text and small size", () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album_image_small");
      // Act
      final albumImageModel = AlbumImageModel.fromJson(jsonMap);
      // Assert
      expect(albumImageModel.url, jsonMap["#text"]);
      expect(albumImageModel.size, AlbumImageModelSize.small);
    });

    test("should return correct text and medium size", () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album_image_medium");
      // Act
      final albumImageModel = AlbumImageModel.fromJson(jsonMap);
      // Assert
      expect(albumImageModel.url, jsonMap["#text"]);
      expect(albumImageModel.size, AlbumImageModelSize.medium);
    });

    test("should return correct text and large size", () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album_image_large");
      // Act
      final albumImageModel = AlbumImageModel.fromJson(jsonMap);
      // Assert
      expect(albumImageModel.url, jsonMap["#text"]);
      expect(albumImageModel.size, AlbumImageModelSize.large);
    });

    test("should return correct text and extralarge size", () async {
      // Arrange
      final jsonMap = _getMapFromJsonFile("album_image_extra_large");
      // Act
      final albumImageModel = AlbumImageModel.fromJson(jsonMap);
      // Assert
      expect(albumImageModel.url, jsonMap["#text"]);
      expect(albumImageModel.size, AlbumImageModelSize.extralarge);
    });
  });

  group("getSpecificImageUrlFromList", () {
    final smallMap = {"#text": "small", "size": "small"};
    final mediumMap = {"#text": "medium", "size": "medium"};
    final largeMap = {"#text": "large", "size": "large"};
    final extraLargeMap = {"#text": "extralarge", "size": "extralarge"};

    test("should return small image as it is available", () async {
      // Arrange
      final testList = [smallMap, mediumMap, largeMap, extraLargeMap];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.small);
      // Assert
      expect(result, smallMap["#text"]);
    });

    test("should return medium image as it is available", () async {
      // Arrange
      final testList = [smallMap, mediumMap, largeMap, extraLargeMap];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.medium);
      // Assert
      expect(result, mediumMap["#text"]);
    });

    test("should return small image as it is available and medium is not",
        () async {
      // Arrange
      final testList = [smallMap, largeMap, extraLargeMap];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.medium);
      // Assert
      expect(result, smallMap["#text"]);
    });

    test("should return large image as it is available", () async {
      // Arrange
      final testList = [smallMap, mediumMap, largeMap, extraLargeMap];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.large);
      // Assert
      expect(result, largeMap["#text"]);
    });

    test("should return extra large image as it is available", () async {
      // Arrange
      final testList = [smallMap, mediumMap, largeMap, extraLargeMap];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.extralarge);
      // Assert
      expect(result, extraLargeMap["#text"]);
    });

    test("should return extra large image as it is available", () async {
      // Arrange
      final testList = [smallMap, mediumMap, largeMap, extraLargeMap];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.extralarge);
      // Assert
      expect(result, extraLargeMap["#text"]);
    });

    test("should return kDefaultAlbumImagePath if exception thrown", () async {
      // Arrange
      final testList = [{"fail": "this should throw exception"}];
      // Act
      final result = AlbumImageModel.getSpecificImageUrlFromList(
          testList, AlbumImageModelSize.extralarge);
      // Assert
      expect(result, kDefaultAlbumImagePath);
    });
  });
}

Map<String, dynamic> _getMapFromJsonFile(String fileName) =>
    json.decode(fixture("album_image/$fileName.json"));
