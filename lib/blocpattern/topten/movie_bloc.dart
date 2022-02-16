import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie.dart';
import '../../models/trending.dart';
import '../../networking/movieapi.dart';
import 'movie_bloc_event.dart';
import 'movie_bloc_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading()){
    on<MovieEventStarted>(_loadMovieData);
  }

  //Migration based on flutter bloc library update
/*  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStateToState(
      int movieId, String query) async* {
    final service = MovieApi();
    yield MovieLoading();
    try {
      List<Movie> movieList;
      movieList = await service.loadTopRatedMovies();
      yield MovieLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieError();
    }
  }*/
  Future<void> _loadMovieData(MovieEventStarted event, Emitter<MovieState> emit) async {
    final service = MovieApi();
    emit (MovieLoading());
    try {
      List<Trending> movieList;
      movieList = await service.loadTrendyMovies();
      emit (MovieLoaded(movieList));
    } on Exception catch (e) {
      print(e);
      emit (MovieError());
    }
  }
}