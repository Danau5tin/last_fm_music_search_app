part of 'album_search_bloc.dart';

abstract class AlbumSearchEvent extends Equatable {
  const AlbumSearchEvent();
}

class AlbumExecuteSearch extends AlbumSearchEvent {
  final String albumName;

  const AlbumExecuteSearch(this.albumName);
  @override
  List<Object?> get props => [albumName];
}
