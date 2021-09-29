
import 'album_model.dart';

class LastFmAlbumSearchResponseModel {
  final int totalNumberResults;
  final int itemsPerPage;
  final List<AlbumModel> albumModels;

  LastFmAlbumSearchResponseModel(
      this.totalNumberResults, this.itemsPerPage, this.albumModels);

  factory LastFmAlbumSearchResponseModel.fromJson(Map<String, dynamic> json) {
    final totalNumberResults = int.parse(json["results"]["opensearch:totalResults"]);
    final itemsPerPage = int.parse(json["results"]["opensearch:itemsPerPage"]);

    final List<AlbumModel> albumModels = List<AlbumModel>.from(
      json["results"]["albummatches"]["album"]
          .map((albumJson) => AlbumModel.fromJson(albumJson)),
    );

    return LastFmAlbumSearchResponseModel(
        totalNumberResults, itemsPerPage, albumModels);
  }
}
