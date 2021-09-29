import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/repositories/album_detail_repository.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/use_cases/get_album_detail_use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:mocktail/mocktail.dart';

class AlbumDetailRepositoryMock extends Mock implements AlbumDetailRepository {}

class DetailedAlbumMock extends Mock implements DetailedAlbum {}

void main() {
  late AlbumDetailRepository repository;
  late GetAlbumDetailUseCase useCase;
  late DetailedAlbum detailedAlbum;

  const albumName = "name";
  const artistName = "artist";
  const album = Album(albumName, artistName, "imageUrl");

  setUp(() {
    detailedAlbum = DetailedAlbumMock();
    repository = AlbumDetailRepositoryMock();
    useCase = GetAlbumDetailUseCase(repository);
  });

  test("should call repository with correct args", () async {
    // Arrange
    when(() => repository.getDetailedAlbum(
            artistName: any(named: "artistName"),
            albumName: any(named: "albumName")))
        .thenAnswer((_) async => DataState.success(detailedAlbum));
    // Act
    useCase(album);
    // Assert
    verify(() => repository.getDetailedAlbum(
        artistName: album.artist, albumName: album.name)).called(1);
  });
}
