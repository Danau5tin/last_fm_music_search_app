import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/repositories/album_search_repository.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/use_cases/search_for_album_use_case.dart';
import 'package:mocktail/mocktail.dart';

class AlbumSearchRepositoryMock extends Mock implements AlbumSearchRepository {}

void main() {
  late AlbumSearchRepository repository;
  late SearchForAlbumUseCase searchForAlbumUseCase;

  setUp(() {
    repository = AlbumSearchRepositoryMock();
    searchForAlbumUseCase = SearchForAlbumUseCase(repository);
  });

  test("should search for albums using the repo", () async {
    // Arrange
    const albumName = "albumName";
    when(() => repository.searchForAlbum(any()))
        .thenAnswer((_) async => const DataState.success([]));
    // Act
    await searchForAlbumUseCase(const SearchForAlbumParams(albumName: albumName));
    // Assert
    verify(() => repository.searchForAlbum(albumName)).called(1);
  });
}
