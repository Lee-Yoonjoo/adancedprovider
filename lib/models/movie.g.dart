// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      backdropPath: json['backdropPath'] as String,
      id: json['id'] as int,
      overview: json['overview'] as String,
      posterPath: json['posterPath'] as String,
      releaseDate: json['releaseDate'] as String,
      title: json['title'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
