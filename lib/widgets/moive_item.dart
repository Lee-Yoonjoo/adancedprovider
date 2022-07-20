import 'package:advancedprovider/movieprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movieItem;

  const MovieItem(this.movieItem, {Key? key}) : super(key: key);

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
                'http://image.tmdb.org/t/p/w500/${movieItem.poster_path}')),
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
                    icon: favoritesList.favoriteMovies
                            .any((element) => element.id == movieItem.id)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border, color: Colors.grey),
                    onPressed: () {
                      !favoritesList.favoriteMovies
                              .any((element) => element.id == movieItem.id)
                          ? favoritesList.add(movieItem)
                          : favoritesList.remove(movieItem);

                      debugPrint('Test OnTap Func from GestureDetector');
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
