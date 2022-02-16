import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocpattern/topten/movie_bloc.dart';
import '../blocpattern/topten/movie_bloc_event.dart';
import '../blocpattern/topten/movie_bloc_state.dart';
import '../models/movie.dart';
import '../models/trending.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  //whole body

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
              if (state is MovieLoaded) {
              List<Trending> trendingMovies = state.movieList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopTenWidget(trendingMovies),
                ],
              );
            } else {
              return Container(
                child: Text('Something went wrong!!!'),
              );
            }
          },
        ),
      ],
    );
  }

  //TopTen Widget
  Widget TopTenWidget(List<Trending> movies) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: 10,
        controller: PageController(viewportFraction: 0.7),
        onPageChanged: (int index) => setState(() => _index = index),
        itemBuilder: (context, i) {
          return Transform.scale(
            scale: i == _index ? 1 : 0.9,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  '${movies[i].title}',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //Comming Soon
  Widget CommingSoonWidget() {
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
/*        BlocProvider<PersonBloc>(
          create: (_) => PersonBloc()..add(PersonEventStated()),
        ),*/
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'MOVIE FOR YOU',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }
}
