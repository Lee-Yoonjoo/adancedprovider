import 'package:flutter/material.dart';

import '../models/trending.dart';

class HomeTopMovieItem extends StatelessWidget {
  const HomeTopMovieItem({Key? key, required this.movie}) : super(key: key);
  final Trending movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: movie.backdrop_path != ''
                    ? FadeInImage(
                        placeholder: const AssetImage(
                            'packages/advancedprovider/images/place_holder.png'),
                        image: NetworkImage(
                            'http://image.tmdb.org/t/p/w500/${movie.backdrop_path}'),
                        fit: BoxFit.cover,
                      )
                    : const Image(
                        image: AssetImage(
                            'packages/advancedprovider/images/place_holder.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
                left: 15,
              ),
              child: Text(
                movie.title != '' ? movie.title : movie.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'muli',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
