// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      backdrop_path: json['backdrop_path'] as String? ?? '',
      id: json['id'] as int,
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String? ?? '',
      release_date: json['release_date'] as String,
      title: json['title'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      vote_count: json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
