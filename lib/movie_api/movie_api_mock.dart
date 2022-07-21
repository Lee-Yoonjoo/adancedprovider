import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import '../models/trending.dart';
import '../models/movie.dart';
import 'movie_api.dart';

class MovieApiMock extends MovieApi {
  var apiKey = {'api_key': '9d9e6bf58b150463d0b2176cc132f1d0'};
  var baseUrl = 'api.themoviedb.org';
  Future<String> getMockPopularMovies() {
    return rootBundle.loadString('packages/advancedprovider/assets/movie_response.json');
  }
  Future<String> getTrendyMovies() {
    return rootBundle.loadString('packages/advancedprovider/assets/trending_response.json');
  }
  @override
  Future<List<Movie>> loadPopularMovies() async {
    Map<String, dynamic> body = json.decode(await getMockPopularMovies());
    List<dynamic> list = body['results'];
    developer.log('MOCK', name: 'LOAD POPULAR MOVIES in MovieAPI');
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }

  @override
  Future<List<Movie>> loadUpcomingMovies() async {
    Map<String, dynamic> body = json.decode(await getTrendyMovies());
    List<dynamic> list = body['results'];
    //developer.log(list.toString(), name: 'JSON DATA in MovieAPI');
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }

  @override
  Future<List<Trending>> loadTrendyMovies() async {
    Map<String, dynamic> body = json.decode(await getTrendyMovies());
    List<dynamic> list = body['results'];
    developer.log('MOCK', name: 'LOAD TRENDY MOVIES in MovieAPI');
    return list.map<Trending>((item) => Trending.fromJson(item)).toList();
  }
}
