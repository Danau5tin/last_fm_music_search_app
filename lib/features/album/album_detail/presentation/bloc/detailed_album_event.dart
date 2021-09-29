part of 'detailed_album_bloc.dart';

abstract class DetailedAlbumEvent extends Equatable {
  const DetailedAlbumEvent();
}

class GetAlbumDetail extends DetailedAlbumEvent {
  final Album album;

  const GetAlbumDetail(this.album);

  @override
  List<Object?> get props => [album];
}
