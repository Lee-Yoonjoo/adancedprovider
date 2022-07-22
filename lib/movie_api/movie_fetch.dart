import 'dart:async';
import 'dart:convert';

import 'package:advancedprovider/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/trending.dart';

Future<List<Movie>> fetchPopularMovies(http.Client client) async {
  final response = await http
      .get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=9d9e6bf58b150463d0b2176cc132f1d0'));

  if (response.statusCode == 200) {Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


Future<List<Trending>> fetchTopTenMovies(http.Client client) async {
  final response = await http
      .get(Uri.parse('[Trendy movies are loaded] https://api.themoviedb.org/3/trending/all/day?api_key=9d9e6bf58b150463d0b2176cc132f1d0'));

  if (response.statusCode == 200) {Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    return list.map<Trending>((item) => Trending.fromJson(item)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}