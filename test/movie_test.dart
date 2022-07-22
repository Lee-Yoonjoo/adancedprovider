//to write Unit test.
// Create MockDataService extends current api service.
// api calls.
// getTopTen(Trending) Movies.
// getPopularMovies.
// getFavoriteMovies.

import 'dart:convert';

import 'package:advancedprovider/locator.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:advancedprovider/models/trending.dart';
import 'package:advancedprovider/movie_api/movie_api.dart';
import 'package:advancedprovider/movie_api/movie_api_impl.dart';
import 'package:advancedprovider/movie_api/movie_api_mock.dart';
import 'package:advancedprovider/movie_api/movie_fetch.dart';
import 'package:advancedprovider/view_models/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

import 'movie_test.mocks.dart';

//class MovieApiMock extends Mock implements MovieApi {}
@GenerateMocks([http.Client])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MovieViewModel sut;
  late MovieApiMock mockApiService;
  setUp(() {
    Future<List<Movie>> fetchPopularMovies(http.Client client) async {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=9d9e6bf58b150463d0b2176cc132f1d0'));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        List<dynamic> list = body['results'];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load album');
      }
    }

    Future<List<Trending>> fetchTopTenMovies(http.Client client) async {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/trending/all/day?api_key=9d9e6bf58b150463d0b2176cc132f1d0'));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        List<dynamic> list = body['results'];
        return list.map<Trending>((item) => Trending.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load album');
      }
    }
  });
  group('fetchMovies', () {
    test('returns Movies if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=9d9e6bf58b150463d0b2176cc132f1d0')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchPopularMovies(client), isA<List<Movie>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(
              'https://api.themoviedb.org/3/trending/all/day?api_key=9d9e6bf58b150463d0b2176cc132f1d0')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchTopTenMovies(client), throwsException);
    });
  });

  /*  group('loadMovies', () {
    mockApiService = MovieApiMock();
    var moviesFromMock = mockApiService.loadPopularMovies();
    void arrangeMoviewsSeviceReturns() {
      when(mockApiService.loadPopularMovies())
          .thenAnswer((_) async => moviesFromMock);
    }

    test('get moives using MovieViewModel', () async {
      arrangeMoviewsSeviceReturns();
      await sut.loadMovies();
      verify(() => mockApiService.loadPopularMovies()).called(1);
    });
  }); */
}
