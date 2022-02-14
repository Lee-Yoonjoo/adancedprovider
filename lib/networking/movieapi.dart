import 'dart:convert';
import 'package:advancedprovider/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

//JSON Automated serialization using code generation
class MovieApi {
  Future<List<Movie>> loadPopularMovies() async {
      var apiKey = {
        'api_key': '9d9e6bf58b150463d0b2176cc132f1d0'
      };
      var uri = Uri.https('api.themoviedb.org', '/3/movie/popular', apiKey);
      final response = await http.get(uri);

      Map<String, dynamic> body = json.decode(response.body);
      List<dynamic> list = body['results'];
      //developer.log(list.toString(), name: 'JSON DATA in MovieAPI');
      return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }

  Future<List<Movie>> loadUpcomingMovies() async {
    var apiKey = {
      'api_key': '9d9e6bf58b150463d0b2176cc132f1d0'
    };
    var uri = Uri.https('api.themoviedb.org', '/3/movie/upcoming', apiKey);
    final response = await http.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    //developer.log(list.toString(), name: 'JSON DATA in MovieAPI');
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }
  Future<List<Movie>> loadTopRatedMovies() async {
    var apiKey = {
      'api_key': '9d9e6bf58b150463d0b2176cc132f1d0'
    };
    var uri = Uri.https('api.themoviedb.org', '/3/movie/top_rated', apiKey);
    final response = await http.get(uri);

    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    //developer.log(list.toString(), name: 'JSON DATA in MovieAPI');
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }

}

