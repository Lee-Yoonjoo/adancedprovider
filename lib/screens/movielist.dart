import 'package:advancedprovider/networking/movieapi.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  late MovieProvider movieProvider;

  final _saved = <Movie>{};
  Widget movieListItemWidget(Movie movieItem){
    final alreadySaved = _saved.contains(movieItem);
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network('http://image.tmdb.org/t/p/w500/${movieItem.posterPath}')),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(),
                Text(
                  movieItem.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  child:  Column(
                    children : [
                      SizedBox(
                        height: 100,
                        child: Text(
                          movieItem.overview,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 13),
                          maxLines: 8,
                        ),
                      ),
                     Center(
                      child:Container(
                        height: 10,

                      child:  Icon(
                        alreadySaved ? Icons.favorite : Icons.favorite_border,
                        color: alreadySaved ? Colors.red : null,
                        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
                      ),
                      ) ,

                     ),

                    ],
                  ),

                ),

              ],
            ),
          ),
        ),
      ],
    );

  }

  Widget movieListWidget(List<Movie> movies) {
    return ListView.separated(
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
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: movieListItemWidget(movies[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    movieProvider = Provider.of<MovieProvider>(context,listen: false);
    movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          //When the data is well loaded
          if (provider.movies.isNotEmpty) {
            return movieListWidget(provider.movies);
          }
          //While the data is loading.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MovieProvider extends ChangeNotifier {
  MovieApi _movieData = MovieApi();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  loadMovies() async {
    List<Movie> listMovies = await _movieData.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }

  clearMovies() {
    _movies.clear();
  }
}
