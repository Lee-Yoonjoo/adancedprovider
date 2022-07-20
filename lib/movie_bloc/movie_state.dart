import 'package:equatable/equatable.dart';

import '../../models/trending.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {}

class MovieStateLoadMovies extends MovieState {
  final List<Trending> movieList;
  const MovieStateLoadMovies(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class MovieError extends MovieState {}
