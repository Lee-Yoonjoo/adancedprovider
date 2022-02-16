import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advancedprovider/screens/bottomnavigation.dart';
import 'movieprovider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

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

