import 'package:last_fm_music_search_app/core/resources/data_state.dart';

abstract class UseCase<T, P> {
  Future<DataState<T>> call(P params);
}
