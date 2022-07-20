
import 'package:flutter/material.dart';

import '../models/movie.dart';

class FavoriteItem extends StatelessWidget {
  final Movie movieItem;

  const FavoriteItem(this.movieItem, {Key? key}) : super(key: key);

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
                        'http://image.tmdb.org/t/p/w500/${movieItem.poster_path}'),
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
