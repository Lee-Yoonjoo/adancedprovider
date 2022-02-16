// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) => Trending(
      id: json['id'] as int,
      posterPath: json['posterPath'] as String?,
     // voteAverage: (json['voteAverage'] as num).toDouble(),
      overview: json['overview'] as String?,
      releaseDate: json['releaseDate'] as String?,
      voteCount: json['voteCount'] as int,
      backdropPath: json['backdropPath'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'id': instance.id,
      'posterPath': instance.posterPath,
    //  'voteAverage': instance.voteAverage,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'voteCount': instance.voteCount,
      'backdropPath': instance.backdropPath,
      'title': instance.title,
    };
