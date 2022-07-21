import 'dart:convert';
import 'package:advancedprovider/models/movie.dart';
import 'package:advancedprovider/movie_api/movie_api.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import '../models/trending.dart';

//JSON Automated serialization using code generation
class MovieApiImpl extends MovieApi{
    var apiKey = {'api_key': '9d9e6bf58b150463d0b2176cc132f1d0'};
    var baseUrl = 'api.themoviedb.org';

  @override
  Future<List<Movie>> loadPopularMovies() async {
    var uri = Uri.https(baseUrl, '/3/movie/popular', apiKey);
    final response = await http.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    developer.log('$uri', name: 'Popular Movies are loaded');
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }

  @override
  Future<List<Movie>> loadUpcomingMovies() async {
    var uri = Uri.https(baseUrl, '/3/movie/upcoming', apiKey);
    final response = await http.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }

  @override
  Future<List<Trending>> loadTrendyMovies() async {
    var uri = Uri.https(baseUrl, '/3/trending/all/day', apiKey);
    final response = await http.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    developer.log('$uri', name: 'Trendy movies are loaded');
    return list.map<Trending>((item) => Trending.fromJson(item)).toList();
  }
}
