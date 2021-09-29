part of 'detailed_album_bloc.dart';

abstract class DetailedAlbumState extends Equatable {
  const DetailedAlbumState();
}

class DetailedAlbumInitial extends DetailedAlbumState {
  @override
  List<Object> get props => [];
}

class DetailedAlbumLoading extends DetailedAlbumState {
  @override
  List<Object> get props => [];
}

class DetailedAlbumRetrieved extends DetailedAlbumState {
  final DetailedAlbum detailedAlbum;

  const DetailedAlbumRetrieved(this.detailedAlbum);

  @override
  List<Object?> get props => [detailedAlbum];
}

class DetailedAlbumError extends DetailedAlbumState {
  final String message;

  const DetailedAlbumError(this.message);

  @override
  List<Object> get props => [message];
}
