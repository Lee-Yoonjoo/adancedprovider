
import 'package:flutter/material.dart';



class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Movie List'),
     ),
    );
  }

}





class MovieProvider extends ChangeNotifier{
}
