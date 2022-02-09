import 'package:flutter/material.dart';
import 'package:advancedprovider/networking/movieapi.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:advancedprovider/screens/home.dart';
import 'package:advancedprovider/screens/movielist.dart';
import 'package:provider/provider.dart';






class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}





class ButtomNavigationProvider extends ChangeNotifier{
}
