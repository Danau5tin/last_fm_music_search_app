import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/last_fm_album_search_response_model.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/repositories/album_search_repository_impl.dart';
import 'package:last_fm_music_search_app/features/album/shared_data_source/last_fm_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

class LastFmRemoteDataSourceMock extends Mock
    implements LastFmRemoteDataSource {}

class ResponseMock extends Mock implements Response {}

class LastFmAlbumSearchResponseModelMock extends Mock
    implements LastFmAlbumSearchResponseModel {}

void main() {
  late AlbumSearchRepositoryImpl albumSearchRepository;
  late LastFmRemoteDataSource lastFmRemoteDataSource;
  late LastFmAlbumSearchResponseModel lastFmResponseModel;
  late Response response;

  setUp(() {
    response = ResponseMock();
    lastFmResponseModel = LastFmAlbumSearchResponseModelMock();
    lastFmRemoteDataSource = LastFmRemoteDataSourceMock();
    albumSearchRepository = AlbumSearchRepositoryImpl(lastFmRemoteDataSource);
  });

  group("searchForAlbum", () {
    test("should return Success if response is 200", () async {
      // Arrange
      when(() => lastFmRemoteDataSource.searchForAlbumByName(any()))
          .thenAnswer((_) async => HttpResponse(lastFmResponseModel, response));
      when(() => lastFmResponseModel.albumModels).thenReturn([]);
      when(() => response.statusCode).thenReturn(200);
      // Act
      final result = await albumSearchRepository.searchForAlbum("albumName");
      // Assert
      expect(result, isA<Success>());
    });

    test("should return Failure if response is 404", () async {
      // Arrange
      when(() => lastFmRemoteDataSource.searchForAlbumByName(any()))
          .thenAnswer((_) async => HttpResponse(lastFmResponseModel, response));
      when(() => response.statusCode).thenReturn(404);
      // Act
      final result = await albumSearchRepository.searchForAlbum("albumName");
      // Assert
      expect(result, isA<Failure>());
    });

    test("should return Failure if exception thrown", () async {
      // Arrange
      when(() => lastFmRemoteDataSource.searchForAlbumByName(any()))
          .thenAnswer((_) async => HttpResponse(lastFmResponseModel, response));
      when(() => response.statusCode).thenThrow(Exception("message"));
      // Act
      final result = await albumSearchRepository.searchForAlbum("albumName");
      // Assert
      expect(result, isA<Failure>());
    });
  });
}
