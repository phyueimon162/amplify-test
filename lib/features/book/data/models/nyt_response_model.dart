import 'package:amplify/features/book/data/models/best_seller_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nyt_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NYTResponse {
  final String status;
  final String copyright;
  final int numResults;
  final String lastModified;
  final BestSellerListModel results;

  NYTResponse({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.lastModified,
    required this.results,
  });
  factory NYTResponse.fromJson(Map<String, dynamic> json) {
    return _$NYTResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NYTResponseToJson(this);
}
