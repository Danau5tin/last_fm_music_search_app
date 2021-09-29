import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_model.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/last_fm_album_search_response_model.dart';

import '../../../../../fixtures/fixture_reader.dart';


void main() {
  group("fromJson", () {
    test("should return correct model from successful json", () async {
      // Arrange
      final jsonMap = json.decode(
          fixture("last_fm_response/last_fm_album_search_response.json"));
      // Act
      final searchResult = LastFmAlbumSearchResponseModel.fromJson(jsonMap);
      // Assert
      expect(searchResult, isA<LastFmAlbumSearchResponseModel>());
      expect(searchResult.albumModels.length, searchResult.itemsPerPage);
      expect(searchResult.albumModels.first, isA<AlbumModel>());
      expect(searchResult.totalNumberResults,
          int.parse(jsonMap["results"]["opensearch:totalResults"]));
    });

    test("should return correct model from successful empty json", () async {
      // Arrange
      final jsonMap = json.decode(
          fixture("last_fm_response/last_fm_album_search_response_empty.json"));
      // Act
      final searchResult = LastFmAlbumSearchResponseModel.fromJson(jsonMap);
      // Assert
      expect(searchResult, isA<LastFmAlbumSearchResponseModel>());
      expect(searchResult.albumModels.length, 0);
      expect(searchResult.totalNumberResults,
          int.parse(jsonMap["results"]["opensearch:totalResults"]));
    });
  });
}
