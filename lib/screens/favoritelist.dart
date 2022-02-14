import 'package:advancedprovider/networking/movieapi.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  late FavoriteProvider favoriteProvider;

  final _saved = <Movie>{};

  Widget movieListItemWidget(Movie movieItem) {
    return  Container(
     // margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 200.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[

            //Only with Image it causes "A" RenderFlex overflowed by pixels"
            Flexible(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                      image:NetworkImage(
                          'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}'
                      ),
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
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,),
              ),
            ),
          ],
        ),
    );
  }

  Widget movieListWidget(List<Movie> movies) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
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
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: movieListItemWidget(movies[index]),
              ),
           ),
        );


      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    //understanding Stateful vs Stateless
    favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, provider, child) {
          //When the data is well loaded
          if (provider.favoriteMovies.isNotEmpty) {

            return movieListWidget(provider.favoriteMovies);
          }
          //While the data is loading.
          return  Center(
            child: Text('No favorites added.'),
          );
        },
      ),
    );
  }
}

class FavoriteProvider extends ChangeNotifier {
  final List<Movie> _favoriteMovies = [];
  List<Movie> get favoriteMovies => _favoriteMovies;
  bool _isAdded = false;
  bool get isAdded => _isAdded;

  void add(Movie favoriteMovie) {
    _favoriteMovies.add(favoriteMovie);
    notifyListeners();

    developer.log('${favoriteMovie.title} is added', name: 'FavoriteProvider');
  }

  void remove(Movie favoriteMovie) {
    _favoriteMovies.removeWhere((element) => element.id == favoriteMovie.id);
    notifyListeners();
    developer.log('${favoriteMovie.title} is removed', name: 'FavoriteProvider');
  }
  set isAdded(bool value) {
    _isAdded = value;
    notifyListeners();
  }
}
