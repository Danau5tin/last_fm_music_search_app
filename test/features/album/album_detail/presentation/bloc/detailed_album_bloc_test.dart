import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/use_cases/get_album_detail_use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/bloc/detailed_album_bloc.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:mocktail/mocktail.dart';

class GetAlbumDetailUseCaseMock extends Mock implements GetAlbumDetailUseCase {}

class DetailedAlbumMock extends Mock implements DetailedAlbum {}

void main() {
  late GetAlbumDetailUseCase albumDetailUseCase;
  late DetailedAlbumBloc detailedAlbumBloc;

  const album = Album("name", "artist", "imageUrl");
  final DetailedAlbum detailedAlbum = DetailedAlbumMock();

  setUp(() {
    albumDetailUseCase = GetAlbumDetailUseCaseMock();
    detailedAlbumBloc = DetailedAlbumBloc(albumDetailUseCase);
  });

  test("should have initial state of DetailedAlbumInitial", () async {
    // Assert
    expect(detailedAlbumBloc.state, isA<DetailedAlbumInitial>());
  });

  group("GetAlbumDetail", () {
    blocTest<DetailedAlbumBloc, DetailedAlbumState>(
      'should emit DetailedAlbumRetrieved when DataSuccess returned',
      setUp: () {
        when(() => albumDetailUseCase(album))
            .thenAnswer((_) async => DataState.success(detailedAlbum));
      },
      build: () => detailedAlbumBloc,
      act: (bloc) => bloc.add(const GetAlbumDetail(album)),
      expect: () =>
          [isA<DetailedAlbumLoading>(), isA<DetailedAlbumRetrieved>()],
    );

    blocTest<DetailedAlbumBloc, DetailedAlbumState>(
      'should emit DetailedAlbumError when DataFailure returned',
      setUp: () {
        when(() => albumDetailUseCase(album))
            .thenAnswer((_) async => const DataState.failure("message"));
      },
      build: () => detailedAlbumBloc,
      act: (bloc) => bloc.add(const GetAlbumDetail(album)),
      expect: () => [isA<DetailedAlbumLoading>(), isA<DetailedAlbumError>()],
    );
  });
}
