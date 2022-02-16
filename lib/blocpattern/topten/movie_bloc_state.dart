import 'package:equatable/equatable.dart';

import '../../models/movie.dart';
import '../../models/trending.dart';


abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}


class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Trending> movieList;
  const MovieLoaded(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class MovieError extends MovieState {}
