import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

abstract class AlbumSearchRepository {
  Future<DataState<List<Album>>> searchForAlbum(String albumName);
}