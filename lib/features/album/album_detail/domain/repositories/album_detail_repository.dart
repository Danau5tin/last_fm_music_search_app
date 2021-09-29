import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';

abstract class AlbumDetailRepository {
  Future<DataState<DetailedAlbum>> getDetailedAlbum(
      {required String artistName, required String albumName});
}
