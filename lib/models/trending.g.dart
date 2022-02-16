// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) => Trending(
      id: json['id'] as int,
      poster_path: json['poster_path'] as String? ?? '',
      vote_average: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      release_date: json['release_date'] as String? ?? '',
      vote_count: json['vote_count'] as int,
      backdrop_path: json['backdrop_path'] as String? ?? '',
      title: json['title'] as String? ?? '',
      name: json['name'] as String? ?? '',
      first_air_date: json['first_air_date'] as String? ?? '',
    );

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.poster_path,
      'vote_average': instance.vote_average,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'vote_count': instance.vote_count,
      'backdrop_path': instance.backdrop_path,
      'title': instance.title,
      'name': instance.name,
      'first_air_date': instance.first_air_date,
    };
