import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advancedprovider/networking/movieapi.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:advancedprovider/screens/home.dart';
import 'package:advancedprovider/screens/movielist.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ButtomNavigationProvider()),
        ],
        child: Home(),
      ),
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => CounterProvider(),
      //   child: Home(),
      // ),
    );
  }
}

