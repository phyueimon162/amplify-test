import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/book/domains/entities/book_response.dart';
import 'package:amplify/features/book/domains/repositories/book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_service.g.dart';

@riverpod
BookService bookService(ref) {
  return BookService(ref.read(bookRepoProvider));
}

class BookService {
  final BookRepository _bookRepository;

  BookService(this._bookRepository);

  Future<ApiResult<BookResponse>> getBooks(
      {required String bestSellerName, required int offset}) async {
    return await _bookRepository.fetchLatestBook(
        bestSellerName: bestSellerName, offset: offset);
  }
}
