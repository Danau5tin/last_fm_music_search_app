import 'package:dio/dio.dart';
import 'package:last_fm_music_search_app/features/album/album_detail/data/models/detailed_album_model.dart';
import 'package:last_fm_music_search_app/features/album/album_search/data/models/last_fm_album_search_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'last_fm_remote_data_source.g.dart';

const String apiKey = "1c69e4c6fa39824f2f765012429501c3";

@RestApi(baseUrl: "https://ws.audioscrobbler.com/2.0/")
abstract class LastFmRemoteDataSource {
  factory LastFmRemoteDataSource(Dio dio, {String baseUrl}) =
      _LastFmRemoteDataSource;

  @GET("")
  Future<HttpResponse<LastFmAlbumSearchResponseModel>> searchForAlbumByName(
    @Query("album") String album, {
    @Query("method") String method = "album.search",
    @Query("api_key") String apiKey = apiKey,
    @Query("format") String format = "json",
  });

  @GET("")
  Future<HttpResponse<DetailedAlbumModel>> getDetailedAlbum(
    @Query("artist") String artistName,
    @Query("album") String albumName, {
    @Query("method") String method = "album.getInfo",
    @Query("api_key") String apiKey = apiKey,
    @Query("format") String format = "json",
  });
}
