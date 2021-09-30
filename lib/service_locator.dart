import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/repositories/album_detail_repository_impl.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/repositories/album_detail_repository.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/domain/use_cases/get_album_detail_use_case.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/bloc/detailed_album_bloc.dart';

import 'features/album/album_search/data/repositories/album_search_repository_impl.dart';
import 'features/album/album_search/domain/repositories/album_search_repository.dart';
import 'features/album/album_search/domain/use_cases/search_for_album_use_case.dart';
import 'features/album/album_search/presentation/bloc/album_search_bloc.dart';
import 'features/album/shared_data_source/last_fm_remote_data_source.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  _setUpNetwork();
  _setUpAlbumSearchFeature();
  _setUpDetailedAlbumFeature();
}

void _setUpNetwork() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LastFmRemoteDataSource>(
      () => LastFmRemoteDataSource(sl()));
}

void _setUpAlbumSearchFeature() {
  sl.registerLazySingleton<AlbumSearchRepository>(
      () => AlbumSearchRepositoryImpl(sl()));
  sl.registerLazySingleton<SearchForAlbumUseCase>(
      () => SearchForAlbumUseCase(sl()));
  sl.registerFactory<AlbumSearchBloc>(() => AlbumSearchBloc(sl()));
}

void _setUpDetailedAlbumFeature() {
  sl.registerLazySingleton<AlbumDetailRepository>(
      () => AlbumDetailRepositoryImpl(sl()));
  sl.registerLazySingleton<GetAlbumDetailUseCase>(
      () => GetAlbumDetailUseCase(sl()));
  sl.registerFactory<DetailedAlbumBloc>(() => DetailedAlbumBloc(sl()));
}
