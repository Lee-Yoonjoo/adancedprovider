import '../models/movie.dart';
import '../models/trending.dart';

abstract class MovieApi {
  Future<List<Movie>> loadPopularMovies();

  Future<List<Movie>> loadUpcomingMovies();

  Future<List<Trending>> loadTrendyMovies();
}
