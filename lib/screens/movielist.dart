
import 'package:advancedprovider/screens/favoritelist.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../movieprovider.dart';



class MovieList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: ListView.builder(
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
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: MovieListItemWidget(movieProvider.movies[index]),
            ),
          );
        },

      ),
    );
  }
}



class MovieListItemWidget extends StatelessWidget {

  final Movie movieItem;

  const MovieListItemWidget(this.movieItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<MovieProvider>();
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
                'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}')),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: Text(
                    movieItem.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        width: 800,
                        child: Text(
                          movieItem.overview,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 13),
                          maxLines: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  trailing: IconButton(
                    icon:favoritesList.favoriteMovies.any((element) => element.id == movieItem.id)
                        ? const Icon(Icons.favorite, color: Colors.red,)
                        : const Icon(Icons.favorite_border, color: Colors.grey),
                    onPressed: () {

                      !favoritesList.favoriteMovies.any((element) => element.id == movieItem.id)
                          ? favoritesList.add(movieItem)
                          : favoritesList.remove(movieItem);

                      developer.log('OnTap works. Set State ', name: 'Test OnTap Func from GestureDetector');
                      // developer.log('${favoritesList.isAdded}', name: 'Update ListTile');
                      for (var i = 0; i < favoritesList.favoriteMovies.length; i++) {
                        developer.log('${favoritesList.favoriteMovies[i].title}', name: 'Data List');
                      }

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }


}