import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieEventLoadMovies extends MovieEvent {
  const MovieEventLoadMovies();

  @override
  List<Object> get props => [];
}