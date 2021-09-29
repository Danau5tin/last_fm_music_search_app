import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/entities/detailed_album.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/use_cases/get_album_detail_use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';

part 'detailed_album_event.dart';

part 'detailed_album_state.dart';

class DetailedAlbumBloc extends Bloc<DetailedAlbumEvent, DetailedAlbumState> {
  final GetAlbumDetailUseCase _getAlbumDetailUseCase;

  DetailedAlbumBloc(this._getAlbumDetailUseCase)
      : super(DetailedAlbumInitial()) {
    on<GetAlbumDetail>((event, emit) async {
      emit(DetailedAlbumLoading());
      final result = await _getAlbumDetailUseCase(event.album);
      result.when(
          success: (detailedAlbum) =>
              emit(DetailedAlbumRetrieved(detailedAlbum)),
          failure: (message, _) => emit(DetailedAlbumError(message)));
    });
  }


}
