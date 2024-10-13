// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nyt_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NYTResponse _$NYTResponseFromJson(Map<String, dynamic> json) => NYTResponse(
      status: json['status'] as String,
      copyright: json['copyright'] as String,
      numResults: (json['num_results'] as num).toInt(),
      lastModified: json['last_modified'] as String,
      results:
          BestSellerListModel.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NYTResponseToJson(NYTResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results.toJson(),
    };
