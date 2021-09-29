import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/bloc/album_search_bloc.dart';
import 'package:last_fm_music_search_app/features/album/album_search/presentation/widgets/album_list_view.dart';
import 'package:last_fm_music_search_app/core/common_presentation/centered_progress_bar.dart';
import 'package:last_fm_music_search_app/core/common_presentation/something_went_wrong_centered_display.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumSearchBloc, AlbumSearchState>(
        builder: (context, state) => Scaffold(
            appBar: AppBar(title: Text(_getAppBarTitle(state))),
            body: _buildBody(context, state)));
  }

  String _getAppBarTitle(AlbumSearchState state) {
    if (state is AlbumsSearchSuccess) {
      return state.originalSearchQuery;
    }
    if (state is AlbumSearchLoading) {
      return "Loading";
    }
    return "Error";
  }

  Widget _buildBody(BuildContext context, AlbumSearchState state) {
    if (state is AlbumsRetrieved) {
      return AlbumListView(albums: state.albums);
    }
    if (state is AlbumsNotFound) {
      return SomethingWentWrongCenteredDisplay(
          message: "No albums found for ${state.originalSearchQuery}");
    }
    if (state is AlbumSearchLoading) {
      return CenteredProgressBar(
          color: Theme.of(context).colorScheme.secondary);
    }
    if (state is AlbumsError) {
      return SomethingWentWrongCenteredDisplay(message: state.message);
    }
    return const SomethingWentWrongCenteredDisplay(message: "Unexpected error");
  }
}

class SearchResultsScreenArgs {
  final String albumName;

  SearchResultsScreenArgs(this.albumName);
}
