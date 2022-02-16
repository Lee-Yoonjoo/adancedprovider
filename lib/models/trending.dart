import 'package:json_annotation/json_annotation.dart';
part 'trending.g.dart';
@JsonSerializable()
class Trending {
  final int id;
  final String? posterPath;
  //final double voteAverage;
  final String? overview;
  final String? releaseDate;
  final int voteCount;
  final String? backdropPath;
  final String? title;

  Trending(
      {required this.id,
      required this.posterPath,
    //  required this.voteAverage,
      required this.overview,
      required this.releaseDate,
      required this.voteCount,
      required this.backdropPath,
      required this.title});

  factory Trending.fromJson(Map<String,dynamic> data) => _$TrendingFromJson(data);
  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}
