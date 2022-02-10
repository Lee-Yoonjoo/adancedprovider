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

  Widget movieListWidget(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(

          child:Text(movies[index].title),

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
          if (provider.movies != null && provider.movies.length > 0) {
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
