import 'package:advancedprovider/movieprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';

class HomeCategoryTitle extends StatelessWidget {
  final Movie movieItem;

  const HomeCategoryTitle(this.movieItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Text(
        'Comming Soon'.toUpperCase(),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
          fontFamily: 'muli',
        ),
      ),
    );
  }
}
