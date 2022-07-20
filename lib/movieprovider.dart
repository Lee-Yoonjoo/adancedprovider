import 'package:flutter/material.dart';

import 'models/movie.dart';

import 'dart:developer' as developer;

import 'movie_api/movie_api.dart';

class MovieProvider extends ChangeNotifier {
  final MovieApi _movieData = MovieApi();
  List<Movie> _movies = [];
  final List<Movie> _favoriteMovies = [];

  List<Movie> get movies => _movies;
  List<Movie> get favoriteMovies => _favoriteMovies;

  loadMovies() async {
    List<Movie> listMovies = await _movieData.loadPopularMovies();
    _movies = listMovies;
    notifyListeners();
  }

  clearMovies() {
    _movies.clear();
  }

  void add(Movie favoriteMovie) {
    _favoriteMovies.add(favoriteMovie);
    developer.log('${favoriteMovie.title} is added', name: 'FavoriteProvider');
    notifyListeners();
  }

  void remove(Movie favoriteMovie) {
    _favoriteMovies.removeWhere((element) => element.id == favoriteMovie.id);
    notifyListeners();
    developer.log('${favoriteMovie.title} is removed',
        name: 'FavoriteProvider');
  }
}
