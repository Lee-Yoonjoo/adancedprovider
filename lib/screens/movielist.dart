import 'package:advancedprovider/networking/movieapi.dart';
import 'package:advancedprovider/screens/favoritelist.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieProvider movieProvider;
  late FavoriteProvider favoriteProvider;
  IconData icon = Icons.favorite_border;
  Color color = Colors.grey;
  bool isAdded = false;

  Widget movieListItemWidget(Movie movieItem) {
    favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final favoritesList = favoriteProvider.favoriteMovies;
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
                  /*    leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        developer.log('OnTap works. Set State ',
                            name: 'Test OnTap Func from GestureDetector');
                        !favoritProvider.favoriteMovies.contains(movieItem)
                            ? favoritesList.add(movieItem)
                            : favoritesList.remove(movieItem);
                     */ /*   ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(favoritProvider.favoriteMovies
                                    .contains(movieItem)
                                ? 'Added to favorites.'
                                : 'Removed from favorites.'),
                            duration: const Duration(seconds: 1),
                          ),
                        );*/ /*
                      });
                    },

                  ),*/
                  trailing: IconButton(
                    icon: favoritesList.contains(movieItem)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border, color: Colors.grey),
                    onPressed: () {
                      developer.log('OnTap works. Set State ', name: 'Test OnTap Func from GestureDetector');

                      !favoritesList.contains(movieItem)
                          ? favoriteProvider.add(movieItem)
                          : favoriteProvider.remove(movieItem);
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

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: Text('Close'),
        ),
      ],
    );
  }

  Widget movieListWidget(List<Movie> movies) {
    return ListView.separated(
      shrinkWrap: true,
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
    movieProvider = Provider.of<MovieProvider>(context, listen: false);
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

/*   _pushSaved(Movie favoriteMovie) {
     favoritProvider = Provider.of<FavoriteProvider>(context, listen: false);
    Navigator.pushNamed(context, favoritProvider.addFavorites(favoriteMovie));
  }*/
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
