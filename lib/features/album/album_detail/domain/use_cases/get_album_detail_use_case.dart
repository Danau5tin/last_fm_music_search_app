import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/core/use_case/use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/repositories/album_detail_repository.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

class GetAlbumDetailUseCase extends UseCase<DetailedAlbum, Album> {
  final AlbumDetailRepository _albumDetailRepository;

  GetAlbumDetailUseCase(this._albumDetailRepository);

  @override
  Future<DataState<DetailedAlbum>> call(Album params) async =>
      _albumDetailRepository.getDetailedAlbum(
          albumName: params.name, artistName: params.artist);
}
