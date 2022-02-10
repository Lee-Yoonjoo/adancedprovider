import 'package:flutter/material.dart';
import 'package:advancedprovider/screens/home.dart';
import 'package:advancedprovider/screens/movielist.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import 'favoritelist.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentNavigationIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return MovieList();
        break;
      case 2:
        return FavoriteList();
        break;
    }
    return Container();
  }

  //Why it should be 'late'
  late BottomNavigationProvider _bottomNavigationProvider;

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
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

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get currentNavigationIndex => _index;

  updatePage(int index) {
    _index = index;
    notifyListeners();
  }
}
