import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../view_models/bottom_navi_view_model.dart';
import '../views/favorite_list.dart';
import '../views/home.dart';
import '../views/movie_list.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentNavigationIndex) {
      case 0:
        return const Home();
      case 1:
        return const MovieList();
      case 2:
        return const FavoriteList();
    }
    return Container();
  }

  //Why it should be 'late'
  late BottomNavigationViewModel _bottomNavigationProvider;

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationViewModel>(context);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_movies), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        currentIndex: _bottomNavigationProvider.currentNavigationIndex,
        selectedItemColor: Colors.red[800],
        onTap: (index) {
          developer.log('${_bottomNavigationProvider.currentNavigationIndex}',
              name: 'Current Page Index');
          _bottomNavigationProvider.updatePage(index);
        },
      ),
    );
  }
}
