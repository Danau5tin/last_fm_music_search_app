import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:last_fm_music_search_app/core/resources/data_state.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/use_cases/search_for_album_use_case.dart';

part 'album_search_event.dart';

part 'album_search_state.dart';

class AlbumSearchBloc extends Bloc<AlbumSearchEvent, AlbumSearchState> {
  final SearchForAlbumUseCase _searchForAlbumUseCase;

  AlbumSearchBloc(this._searchForAlbumUseCase) : super(AlbumSearchInitial()) {
    on<AlbumExecuteSearch>((event, emit) async {
      emit(AlbumSearchLoading());
      final DataState<List<Album>> result = await _searchForAlbumUseCase(
          SearchForAlbumParams(albumName: event.albumName));
      result.when(success: (albumList) {
        if (albumList.isEmpty) {
          emit(AlbumsNotFound(event.albumName));
        } else {
          emit(AlbumsRetrieved(albumList, event.albumName));
        }
      }, failure: (message, _) {
        emit(AlbumsError(message));
      });
    });
  }
}
