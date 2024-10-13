import 'package:amplify/features/book/data/models/isbn_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BookModel {
  final int rank;
  final int rankLastWeek;
  final int weeksOnList;
  final int asterisk;
  final int dagger;
  final String primaryIsbn10;
  final String primaryIsbn13;
  final String publisher;
  final String description;
  final String price;
  final String title;
  final String author;
  final String contributor;
  final String contributorNote;
  final String bookImage;
  final String amazonProductUrl;
  final String ageGroup;
  final String bookReviewLink;
  final String firstChapterLink;
  final String sundayReviewLink;
  final String articleChapterLink;
  final List<ISBNModel> isbns;

  BookModel({
    required this.rank,
    required this.rankLastWeek,
    required this.weeksOnList,
    required this.asterisk,
    required this.dagger,
    required this.primaryIsbn10,
    required this.primaryIsbn13,
    required this.publisher,
    required this.description,
    required this.price,
    required this.title,
    required this.author,
    required this.contributor,
    required this.contributorNote,
    required this.bookImage,
    required this.amazonProductUrl,
    required this.ageGroup,
    required this.bookReviewLink,
    required this.firstChapterLink,
    required this.sundayReviewLink,
    required this.articleChapterLink,
    required this.isbns,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
