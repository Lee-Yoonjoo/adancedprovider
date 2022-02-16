// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      backdropPath: json['backdrop_path'],
      id : json['id'] as int,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );


Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id' : instance.id,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
