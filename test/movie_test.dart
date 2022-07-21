//to write Unit test.
// Create MockDataService extends current api service.
// api calls.
// getTopTen(Trending) Movies.
// getPopularMovies.
// getFavoriteMovies.

import 'package:advancedprovider/movie_api/movie_api_impl.dart';
import 'package:advancedprovider/view_models/movie_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMoviesService extends Mock implements MovieApi {}

void main() {
  late MovieViewModel sut;
  MockMoviesService mockMoviesService = MockMoviesService();

  setUp(() {
    sut = MovieViewModel(MockMoviesService());
  });

  test("Initial values of movies are correct", () {
    expect(sut.movies, []);
  });

  group('loadMovies', () {
    final moviesFromService = mockMoviesService.loadPopularMovies();
    void arrangeMoviewsSeviceReturns() {
      when(mockMoviesService.loadPopularMovies())
          .thenAnswer((_) async => moviesFromService);
    }

    test('get moives using MovieViewModel', () async {
      arrangeMoviewsSeviceReturns();
      await sut.loadMovies();
      verify(() => mockMoviesService.loadPopularMovies()).called(1);
    });
  });
}
