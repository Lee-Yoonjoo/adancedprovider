import 'package:advancedprovider/movieprovider.dart';
import 'package:advancedprovider/networking/movieapi.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../models/favorite.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, index) =>
            provider.favoriteMovies.isNotEmpty
                ? GridView.builder(
                    itemCount: provider.favoriteMovies.length,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: FavoriteItemTile(provider.favoriteMovies[index]),
                          ),
                        ),
                      );
                    },
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),

            )
                : const Center(
                    child: Text('No favorites added.'),
                  ),
      ),
    );
  }
}


class FavoriteItemTile extends StatelessWidget {
  final Movie movieItem;

  const FavoriteItemTile(this.movieItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Only with Image it causes "A" RenderFlex overflowed by pixels"
          Flexible(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}'),
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(
              movieItem.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
