
class Movie {
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;
  Movie(
      {required this.overview,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.voteAverage,
        required this.voteCount});

  Movie.fromJson(Map<String, dynamic> json)
      : overview = json['overview'] as String,
        posterPath = json['poster_path'] as String,
        releaseDate = json['release_date'] as String,
        title = json['title'] as String,
        voteAverage = double.parse(json['vote_average'].toString()),
        voteCount = json['vote_count'] as int;

  String get posterUrl => 'http://image.tmdb.org/t/p/w500/${this.posterPath}';
}

/*{
"adult": false,
"backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
"genre_ids": [
28,
12,
878
],
"id": 634649,
"original_language": "en",
"original_title": "Spider-Man: No Way Home",
"overview": "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
"popularity": 12335.96,
"poster_path": "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
"release_date": "2021-12-15",
"title": "Spider-Man: No Way Home",
"video": false,
"vote_average": 8.4,
"vote_count": 7356
},

*/