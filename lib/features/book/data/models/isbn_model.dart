import 'package:json_annotation/json_annotation.dart';

part 'isbn_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class ISBNModel {
  final String isbn10;
  final String isbn13;

  ISBNModel({
    required this.isbn10,
    required this.isbn13,
  });
  factory ISBNModel.fromJson(Map<String, dynamic> json) {
    return _$ISBNModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ISBNModelToJson(this);
}
