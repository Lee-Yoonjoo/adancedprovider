
import 'package:flutter/material.dart';

import 'models/movie.dart';
import 'networking/movieapi.dart';

import 'dart:developer' as developer;
class MovieProvider extends ChangeNotifier {
  MovieApi _movieData = MovieApi();
  List<Movie> _movies = [];
  List<Movie> _favoriteMovies = [];

  List<Movie> get movies => _movies;
  List<Movie> get favoriteMovies => _favoriteMovies;

  loadMovies() async {
    List<Movie> listMovies = await _movieData.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }

  clearMovies() {
    _movies.clear();
  }


  void add(Movie favoriteMovie) {
    _favoriteMovies.add(favoriteMovie);
    //isAdded = true;
    developer.log('${favoriteMovie.title} is added', name: 'FavoriteProvider');
    notifyListeners();
  }

  void remove(Movie favoriteMovie) {
    _favoriteMovies.removeWhere((element) => element.id==favoriteMovie.id);
    //isAdded = false;
    notifyListeners();
    developer.log('${favoriteMovie.title} is removed', name: 'FavoriteProvider');
  }

}