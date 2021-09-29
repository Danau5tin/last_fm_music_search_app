import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/album/album_search/data/repositories/album_search_repository_impl.dart';
import 'features/album/album_search/domain/repositories/album_search_repository.dart';
import 'features/album/album_search/domain/use_cases/search_for_album_use_case.dart';
import 'features/album/album_search/presentation/bloc/album_search_bloc.dart';
import 'features/album/shared_data_source/last_fm_remote_data_source.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LastFmRemoteDataSource>(
      () => LastFmRemoteDataSource(sl()));
  sl.registerLazySingleton<AlbumSearchRepository>(
      () => AlbumSearchRepositoryImpl(sl()));
  sl.registerLazySingleton<SearchForAlbumUseCase>(
      () => SearchForAlbumUseCase(sl()));
  sl.registerFactory<AlbumSearchBloc>(() => AlbumSearchBloc(sl()));
}
