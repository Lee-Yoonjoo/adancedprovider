import 'dart:async';

import 'package:advancedprovider/locator.dart';
import 'package:advancedprovider/movie_api/movie_api.dart';
import 'package:advancedprovider/movie_api/movie_api_impl.dart';
import 'package:advancedprovider/movie_api/movie_api_impl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/movie_view_model.dart';
import 'view_models/bottom_navi_view_model.dart';
import 'widgets/bottom_navigation.dart';

void main() { WidgetsFlutterBinding.ensureInitialized();

  var useMockData = false;
  setupLocator(useMockData: useMockData);
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stackTrace) {
    debugPrint('runZonedGuarded: Caught error in my root zone.');
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MovieViewModel _movieViewModel;

  @override
  void initState() {
    _movieViewModel = MovieViewModel();
    _movieViewModel.loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => _movieViewModel),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationViewModel()),
        ],
        child: BottomNavigation(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
