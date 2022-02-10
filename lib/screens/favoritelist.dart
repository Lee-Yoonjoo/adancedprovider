import 'package:advancedprovider/networking/movieapi.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  late FavoritProvider movieProvider;

  final _saved = <Movie>{};

  Widget movieListItemWidget(Movie movieItem) {
    final favorites = _saved.contains(movieItem);
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 200.0,
      child: Card(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(

                movieItem.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,),
              ),
            ),
            //Only with Image it causes "A" RenderFlex overflowed by pixels"
            Flexible(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image:NetworkImage(
                          'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}'
                      ),
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ),
          ],

        ),

      ),
    );

    /*Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieItem.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );*/
  }

  Widget movieListWidget(List<Movie> movies) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 200,
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
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    movieProvider = Provider.of<FavoritProvider>(context, listen: false);
    movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Consumer<FavoritProvider>(
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

class FavoritProvider extends ChangeNotifier {
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
