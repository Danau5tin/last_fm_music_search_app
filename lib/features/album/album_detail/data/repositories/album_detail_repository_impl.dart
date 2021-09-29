import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/repositories/album_detail_repository.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/repositories/album_search_repository_impl.dart';
import 'package:last_fm_music_search_app/features/album/shared_data_source/last_fm_remote_data_source.dart';

class AlbumDetailRepositoryImpl implements AlbumDetailRepository {
  final LastFmRemoteDataSource _lastFmRemoteDataSource;

  AlbumDetailRepositoryImpl(this._lastFmRemoteDataSource);

  @override
  Future<DataState<DetailedAlbum>> getDetailedAlbum({
    required String artistName,
    required String albumName,
  }) async {
    try {
      final result =
          await _lastFmRemoteDataSource.getDetailedAlbum(artistName, albumName);
      if (result.response.statusCode == 200) {
        return DataState.success(result.data);
      } else {
        return const DataState.failure(kDefaultErrorMessage);
      }
    } catch (_) {
      return const DataState.failure(kDefaultErrorMessage);
    }
  }
}
