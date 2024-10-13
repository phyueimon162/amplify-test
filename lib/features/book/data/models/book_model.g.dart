// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      rank: (json['rank'] as num).toInt(),
      rankLastWeek: (json['rank_last_week'] as num).toInt(),
      weeksOnList: (json['weeks_on_list'] as num).toInt(),
      asterisk: (json['asterisk'] as num).toInt(),
      dagger: (json['dagger'] as num).toInt(),
      primaryIsbn10: json['primary_isbn10'] as String,
      primaryIsbn13: json['primary_isbn13'] as String,
      publisher: json['publisher'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      contributor: json['contributor'] as String,
      contributorNote: json['contributor_note'] as String,
      bookImage: json['book_image'] as String,
      amazonProductUrl: json['amazon_product_url'] as String,
      ageGroup: json['age_group'] as String,
      bookReviewLink: json['book_review_link'] as String,
      firstChapterLink: json['first_chapter_link'] as String,
      sundayReviewLink: json['sunday_review_link'] as String,
      articleChapterLink: json['article_chapter_link'] as String,
      isbns: (json['isbns'] as List<dynamic>)
          .map((e) => ISBNModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'rank': instance.rank,
      'rank_last_week': instance.rankLastWeek,
      'weeks_on_list': instance.weeksOnList,
      'asterisk': instance.asterisk,
      'dagger': instance.dagger,
      'primary_isbn10': instance.primaryIsbn10,
      'primary_isbn13': instance.primaryIsbn13,
      'publisher': instance.publisher,
      'description': instance.description,
      'price': instance.price,
      'title': instance.title,
      'author': instance.author,
      'contributor': instance.contributor,
      'contributor_note': instance.contributorNote,
      'book_image': instance.bookImage,
      'amazon_product_url': instance.amazonProductUrl,
      'age_group': instance.ageGroup,
      'book_review_link': instance.bookReviewLink,
      'first_chapter_link': instance.firstChapterLink,
      'sunday_review_link': instance.sundayReviewLink,
      'article_chapter_link': instance.articleChapterLink,
      'isbns': instance.isbns.map((e) => e.toJson()).toList(),
    };
