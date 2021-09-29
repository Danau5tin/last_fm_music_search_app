import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/repositories/album_search_repository.dart';
import 'package:last_fm_music_search_app/features/album/shared_data_source/last_fm_remote_data_source.dart';

const kDefaultErrorMessage = "Unable to complete response at this time";

class AlbumSearchRepositoryImpl implements AlbumSearchRepository {
  final LastFmRemoteDataSource _lastFmRemoteDataSource;

  AlbumSearchRepositoryImpl(this._lastFmRemoteDataSource);

  @override
  Future<DataState<List<Album>>> searchForAlbum(String albumName) async {
    try {
      final result =
          await _lastFmRemoteDataSource.searchForAlbumByName(albumName);
      if (result.response.statusCode == 200) {
        return DataState.success(result.data.albumModels);
      } else {
        return const DataState.failure("Problem with server");
      }
    } catch (e) {
      return const DataState.failure(kDefaultErrorMessage);
    }
  }
}
