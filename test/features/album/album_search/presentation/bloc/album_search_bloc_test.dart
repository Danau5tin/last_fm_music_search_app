import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/album_model.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/use_cases/search_for_album_use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/bloc/album_search_bloc.dart';
import 'package:mocktail/mocktail.dart';

class SearchForAlbumUseCaseMock extends Mock implements SearchForAlbumUseCase {}

void main() {
  late AlbumSearchBloc albumSearchBloc;
  late SearchForAlbumUseCase searchForAlbumUseCase;

  const albumName = "albumName";
  const albumModel = AlbumModel(
    name: albumName,
    artist: 'artist',
    imageUrl: 'imageUrl',
  );

  setUp(() {
    searchForAlbumUseCase = SearchForAlbumUseCaseMock();
    albumSearchBloc = AlbumSearchBloc(searchForAlbumUseCase);
  });

  test("should have initial state of AlbumSearchInitial", () async {
    // Assert
    expect(albumSearchBloc.state, isA<AlbumSearchInitial>());
  });

  group("AlbumExecuteSearch", () {
    blocTest<AlbumSearchBloc, AlbumSearchState>(
      'should emit AlbumsRetrieved when DataSuccess returned and list not empty',
      setUp: () {
        when(() => searchForAlbumUseCase(
                const SearchForAlbumParams(albumName: albumName)))
            .thenAnswer((_) async => const DataState.success([albumModel]));
      },
      build: () => albumSearchBloc,
      act: (bloc) => bloc.add(const AlbumExecuteSearch(albumName)),
      expect: () => [isA<AlbumSearchLoading>(), isA<AlbumsRetrieved>()],
      verify: (bloc) {
        final retrievedState = (bloc.state as AlbumsRetrieved);
        expect(retrievedState.albums.length, 1);
        expect(retrievedState.albums.first, albumModel);
        expect(retrievedState.originalSearchQuery, albumName);
      },
    );

    blocTest<AlbumSearchBloc, AlbumSearchState>(
      'should emit AlbumsNotFound when DataSuccess returned and list is empty',
      setUp: () {
        when(() => searchForAlbumUseCase(
            const SearchForAlbumParams(albumName: albumName)))
            .thenAnswer((_) async => const DataState.success([]));
      },
      build: () => albumSearchBloc,
      act: (bloc) => bloc.add(const AlbumExecuteSearch(albumName)),
      expect: () => [isA<AlbumSearchLoading>(), isA<AlbumsNotFound>()],
      verify: (bloc) {
        final notFoundState = bloc.state as AlbumsNotFound;
        expect(notFoundState.originalSearchQuery, albumName);
      },
    );

    blocTest<AlbumSearchBloc, AlbumSearchState>(
      'should emit AlbumsError when DataFailure returned ',
      setUp: () {
        when(() => searchForAlbumUseCase(
            const SearchForAlbumParams(albumName: albumName)))
            .thenAnswer((_) async => const DataState.failure("message"));
      },
      build: () => albumSearchBloc,
      act: (bloc) => bloc.add(const AlbumExecuteSearch(albumName)),
      expect: () => [isA<AlbumSearchLoading>(), isA<AlbumsError>()],
    );
  });
}
