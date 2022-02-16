import 'package:json_annotation/json_annotation.dart';
part 'trending.g.dart';


@JsonSerializable(explicitToJson: true)
class Trending {

  int id;
  @JsonKey(defaultValue: '')
  String poster_path;
  double vote_average;
  String overview;
  @JsonKey(defaultValue: '')
  String release_date;
  int vote_count;
  @JsonKey(defaultValue: '')
  String backdrop_path;
  @JsonKey(defaultValue: '')
  String title;

  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String first_air_date;


  Trending(
      {required this.id,
        required this.poster_path,
        required this.vote_average,
        required this.overview,
        required this.release_date,
        required this.vote_count,
        required this.backdrop_path,
        required this.title,
        required this.name,
      required this.first_air_date});


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Trending.fromJson(Map<String, dynamic> json) => _$TrendingFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$TrendingToJson(this);

}
