import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/bloc/detailed_album_bloc.dart';
import 'package:last_fm_music_search_app/core/common_presentation/centered_progress_bar.dart';
import 'package:last_fm_music_search_app/core/common_presentation/something_went_wrong_centered_display.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/presentation/widgets/album_detail_body.dart';

class AlbumDetailScreen extends StatelessWidget {
  const AlbumDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailedAlbumBloc, DetailedAlbumState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(_getAppBarTitle(state))),
          body: _buildBody(state),
        );
      },
    );
  }

  String _getAppBarTitle(DetailedAlbumState state) {
    if (state is DetailedAlbumRetrieved) {
      return state.detailedAlbum.name;
    }
    if (state is DetailedAlbumLoading) {
      return "Loading";
    }
    return "Error";
  }

  Widget _buildBody(DetailedAlbumState state) {
    if (state is DetailedAlbumRetrieved) {
      return AlbumDetailBody(state.detailedAlbum);
    }
    if (state is DetailedAlbumLoading) {
      return const CenteredProgressBar();
    }
    if (state is DetailedAlbumError) {
      return SomethingWentWrongCenteredDisplay(message: state.message);
    }
    return const SomethingWentWrongCenteredDisplay(message: "Unexpected error");
  }
}
