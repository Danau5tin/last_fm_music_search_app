import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/detailed_album_model.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/repositories/album_detail_repository_impl.dart';
import 'package:last_fm_music_search_app/features/album/shared_data_source/last_fm_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';

import '../../../album_search/data/repositories/album_search_repository_impl_test.dart';

class DetailedAlbumModelMock extends Mock implements DetailedAlbumModel {}

void main() {
  late AlbumDetailRepositoryImpl albumDetailRepositoryImpl;
  late LastFmRemoteDataSource dataSource;
  late Response response;
  late DetailedAlbumModel detailedAlbum;

  setUp(() {
    dataSource = LastFmRemoteDataSourceMock();
    albumDetailRepositoryImpl = AlbumDetailRepositoryImpl(dataSource);
    detailedAlbum = DetailedAlbumModelMock();
    response = ResponseMock();
  });

  group("getDetailedAlbum", () {
    test("should return Success when response is 200", () async {
      // Arrange
      when(() => response.statusCode).thenReturn(200);
      when(() => dataSource.getDetailedAlbum(any(), any()))
          .thenAnswer((_) async => HttpResponse(detailedAlbum, response));
      // Act
      final result = await albumDetailRepositoryImpl.getDetailedAlbum(
          artistName: "artistName", albumName: "albumName");
      // Assert
      expect(result, isA<Success>());
    });

    test("should return Failure when if response is 404", () async {
      // Arrange
      when(() => response.statusCode).thenReturn(404);
      when(() => dataSource.getDetailedAlbum(any(), any()))
          .thenAnswer((_) async => HttpResponse(detailedAlbum, response));
      // Act
      final result = await albumDetailRepositoryImpl.getDetailedAlbum(
          artistName: "artistName", albumName: "albumName");
      // Assert
      expect(result, isA<Failure>());
    });

    test("should return Failure when exception thrown", () async {
      // Arrange
      when(() => response.statusCode).thenThrow(Exception("message"));
      when(() => dataSource.getDetailedAlbum(any(), any()))
          .thenAnswer((_) async => HttpResponse(detailedAlbum, response));
      // Act
      final result = await albumDetailRepositoryImpl.getDetailedAlbum(
          artistName: "artistName", albumName: "albumName");
      // Assert
      expect(result, isA<Failure>());
    });
  });
}
