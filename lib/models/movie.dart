
//Creating model classes the json_serializable way

import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int id;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;
  Movie(
      {required this.id,
        required this.overview,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.voteAverage,
        required this.voteCount});


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$MovieToJson(this);


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