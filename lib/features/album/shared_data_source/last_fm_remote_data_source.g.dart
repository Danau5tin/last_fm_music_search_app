// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_fm_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LastFmRemoteDataSource implements LastFmRemoteDataSource {
  _LastFmRemoteDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://ws.audioscrobbler.com/2.0/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<LastFmAlbumSearchResponseModel>> searchForAlbumByName(
      album,
      {method = "album.search",
      apiKey = apiKey,
      format = "json"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'album': album,
      r'method': method,
      r'api_key': apiKey,
      r'format': format
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<LastFmAlbumSearchResponseModel>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LastFmAlbumSearchResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<DetailedAlbumModel>> getDetailedAlbum(
      artistName, albumName,
      {method = "album.getInfo", apiKey = apiKey, format = "json"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'artist': artistName,
      r'album': albumName,
      r'method': method,
      r'api_key': apiKey,
      r'format': format
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<DetailedAlbumModel>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DetailedAlbumModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
