// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerListModel _$BestSellerListModelFromJson(Map<String, dynamic> json) =>
    BestSellerListModel(
      listName: json['list_name'] as String,
      bestsellersDate: json['bestsellers_date'] as String,
      publishedDate: json['published_date'] as String,
      displayName: json['display_name'] as String,
      normalListEndsAt: (json['normal_list_ends_at'] as num).toInt(),
      updated: json['updated'] as String,
      books: (json['books'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      corrections: json['corrections'] as List<dynamic>,
    );

Map<String, dynamic> _$BestSellerListModelToJson(
        BestSellerListModel instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'display_name': instance.displayName,
      'normal_list_ends_at': instance.normalListEndsAt,
      'updated': instance.updated,
      'books': instance.books.map((e) => e.toJson()).toList(),
      'corrections': instance.corrections,
    };
