import 'package:advancedprovider/models/trending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie.dart';
import '../../models/trending.dart';
import '../movie_api/movie_api.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading()) {
    on<MovieEventLoadMovies>(_loadMovieData);
  }

  Future<void> _loadMovieData(
      MovieEventLoadMovies event, Emitter<MovieState> emit) async {
    final service = MovieApi();
    emit(MovieLoading());
    try {
      List<Trending> movieList;
      movieList = await service.loadTrendyMovies();
      emit(MovieStateLoadMovies(movieList));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(MovieError());
    }
  }
}
