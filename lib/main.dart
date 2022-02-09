import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advancedprovider/networking/movieapi.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:advancedprovider/screens/bottomnavigation.dart';
import 'package:advancedprovider/screens/movielist.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Usage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationProvider()),
        ],
        child: BottomNavigation(),
      ),
    );
  }
}

