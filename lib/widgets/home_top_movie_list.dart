import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/trending.dart';
import '../movie_bloc/movie_bloc.dart';
import '../movie_bloc/movie_state.dart';
import 'home_top_movie_item.dart';

class HomeTopMovieList extends StatefulWidget {
  const HomeTopMovieList({Key? key}) : super(key: key);

  @override
  State<HomeTopMovieList> createState() => _HomeTopMovieListState();
}

class _HomeTopMovieListState extends State<HomeTopMovieList> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieStateLoadMovies) {
              List<Trending> trendyMovies = state.movieList;
              return SizedBox(
                height: 350,
                child: PageView.builder(
                  itemCount: 10,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) =>
                      setState(() => _index = index),
                  itemBuilder: (context, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: HomeTopMovieItem(
                        movie: trendyMovies[i],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
