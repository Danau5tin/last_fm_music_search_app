import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_fm_music_search_app/core/navigation/routes.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/bloc/detailed_album_bloc.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/screens/album_detail_screen.dart';
import 'package:last_fm_music_search_app/features/album/album_search/domain/entities/album.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/bloc/album_search_bloc.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/screens/search_results_screen.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/screens/search_screen.dart';
import 'package:last_fm_music_search_app/service_locator.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => _returnWidget(settings));
  }

  Widget _returnWidget(RouteSettings settings) {
    final args = settings.arguments;
    final routeName = settings.name;
    if (routeName == Routes.searchResults && args is SearchResultsScreenArgs) {
      return BlocProvider(
        create: (_) =>
            sl<AlbumSearchBloc>()..add(AlbumExecuteSearch(args.albumName)),
        child: const SearchResultsScreen(),
      );
    }
    if (routeName == Routes.albumDetail && args is Album) {
      return BlocProvider(
        create: (_) => sl<DetailedAlbumBloc>()..add(GetAlbumDetail(args)),
        child: const AlbumDetailScreen(),
      );
    }
    return const SearchScreen();
  }
}
