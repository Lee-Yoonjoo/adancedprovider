import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../view_models/movie_view_model.dart';
import '../widgets/moive_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieViewModel>(context, listen: false);
    List<Movie> movies = movieViewModel.movies;
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innnerBoxIsScrolled) => [
                const SliverAppBar(
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    'Movie List',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: MovieItem(movies[index]),
                  ),
                );
              },
            ),
          )),
    );
  }
}
