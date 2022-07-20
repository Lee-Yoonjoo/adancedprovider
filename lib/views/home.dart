import 'package:advancedprovider/widgets/home_top_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/trending.dart';
import '../movie_bloc/movie_bloc.dart';
import '../movie_bloc/movie_event.dart';
import '../movie_bloc/movie_state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(const MovieEventLoadMovies()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'MOVIE FOR YOU',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: const HomeTopMovieList(),
      ),
    );
  } //whole body
}
