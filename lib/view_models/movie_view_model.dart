import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../movie_api/movie_api.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieApi _movieData = MovieApi();
  final List<Movie> _movies = [];
  final List<Movie> _favoriteMovies = [];

  List<Movie> movies = [];
  List<Movie> get favoriteMovies => _favoriteMovies;

  loadMovies() async {
    try {
      movies = await _movieData.loadPopularMovies();
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }

  Future<List<Movie>> getMovies() async {
    var movieList = await _movieData.loadPopularMovies();
    return movieList;
  }
/*
  clearMovies() {
    _movies.clear();
  } */

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
