import 'package:get_it/get_it.dart';

import 'movie_api/movie_api.dart';
import 'movie_api/movie_api_impl.dart';
import 'movie_api/movie_api_mock.dart';

GetIt locator = GetIt.instance;

void setupLocator({required bool useMockData}) {
  if (useMockData) {
    locator.registerLazySingleton<MovieApi>(() => MovieApiMock());
  } else {
    locator.registerLazySingleton<MovieApi>(() => MovieApiImpl());
  }
}
