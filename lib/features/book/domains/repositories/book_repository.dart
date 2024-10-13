import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/book/data/repositories/book_repository_impl.dart';
import 'package:amplify/features/book/domains/entities/book_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_repository.g.dart';

@riverpod
BookRepository bookRepo(ref) {
  return BookRepositoryImpl();
}

abstract class BookRepository {
  Future<ApiResult<BookResponse>> fetchLatestBook(
      {required String bestSellerName, required int offset});
}
