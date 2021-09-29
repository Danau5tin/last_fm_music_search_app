import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final String name;
  final String artist;
  final String imageUrl;

  const Album(this.name, this.artist, this.imageUrl);

  @override
  List<Object?> get props => [name, artist, imageUrl];
}
