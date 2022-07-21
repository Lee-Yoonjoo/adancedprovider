import 'package:flutter/material.dart';

import '../locator.dart';
import '../models/movie.dart';
import '../movie_api/movie_api.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieApi _movieData = locator();
  final List<Movie> _favoriteMovies = [];
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;
  List<Movie> get favoriteMovies => _favoriteMovies;

  loadMovies() async {
    try {
      _movies = await _movieData.loadPopularMovies();
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }

  void add(Movie favoriteMovie) {
    _favoriteMovies.add(favoriteMovie);
    debugPrint('${favoriteMovie.title} is added FavoriteProvider');
    notifyListeners();
  }

  void remove(Movie favoriteMovie) {
    _favoriteMovies.removeWhere((element) => element.id == favoriteMovie.id);
    notifyListeners();
    debugPrint('${favoriteMovie.title} is removed FavoriteProvider');
  }
}
