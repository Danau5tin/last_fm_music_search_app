import 'package:equatable/equatable.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/core/use_case/use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/repositories/album_search_repository.dart';

class SearchForAlbumUseCase extends UseCase<List<Album>, SearchForAlbumParams> {
  final AlbumSearchRepository _albumSearchRepository;

  SearchForAlbumUseCase(this._albumSearchRepository);

  @override
  Future<DataState<List<Album>>> call(SearchForAlbumParams params) async =>
      await _albumSearchRepository.searchForAlbum(params.albumName);
}

class SearchForAlbumParams extends Equatable{
  final String albumName;

  const SearchForAlbumParams({required this.albumName});

  @override
  List<Object?> get props => [albumName];
}
