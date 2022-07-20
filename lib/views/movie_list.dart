import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../movieprovider.dart';
import '../widgets/moive_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.loadMovies();
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
              itemCount: movieProvider.movies.length,
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
                    child: MovieItem(movieProvider.movies[index]),
                  ),
                );
              },
            ),
          )),
    );
  }
}
