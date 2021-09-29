part of 'album_search_bloc.dart';

abstract class AlbumSearchState extends Equatable {
  const AlbumSearchState();
}

class AlbumSearchInitial extends AlbumSearchState {
  @override
  List<Object> get props => [];
}

class AlbumSearchLoading extends AlbumSearchState {
  @override
  List<Object> get props => [];
}

class AlbumsSearchSuccess extends AlbumSearchState {
  final String originalSearchQuery;

  const AlbumsSearchSuccess(this.originalSearchQuery);

  @override
  List<Object?> get props => [originalSearchQuery];
}

class AlbumsRetrieved extends AlbumsSearchSuccess {
  final List<Album> albums;

  const AlbumsRetrieved(this.albums, String originalSearchQuery)
      : super(originalSearchQuery);

  @override
  List<Object?> get props => [albums, originalSearchQuery];
}

class AlbumsNotFound extends AlbumsSearchSuccess {
  const AlbumsNotFound(String originalSearchQuery) : super(originalSearchQuery);

  @override
  List<Object> get props => [];
}

class AlbumsError extends AlbumSearchState {
  final String message;

  const AlbumsError(this.message);

  @override
  List<Object> get props => [message];
}
