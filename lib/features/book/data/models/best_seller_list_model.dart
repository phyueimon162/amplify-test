import 'package:amplify/features/book/data/models/book_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BestSellerListModel {
  final String listName;
  final String bestsellersDate;
  final String publishedDate;
  final String displayName;
  final int normalListEndsAt;
  final String updated;
  final List<BookModel> books;
  final List<dynamic> corrections;

  BestSellerListModel({
    required this.listName,
    required this.bestsellersDate,
    required this.publishedDate,
    required this.displayName,
    required this.normalListEndsAt,
    required this.updated,
    required this.books,
    required this.corrections,
  });

  factory BestSellerListModel.fromJson(Map<String, dynamic> json) {
    return _$BestSellerListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BestSellerListModelToJson(this);
}
