import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/book/application/book_service.dart';
import 'package:amplify/features/book/domains/entities/book_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_list_usecase.g.dart';

@riverpod
BookListUseCase bookListUseCase(ref) {
  return BookListUseCase(ref.read(bookService));
}

class BookListUseCase {
  final BookService bookService;

  BookListUseCase(this.bookService);

  Future<ApiResult<BookResponse>> call({
    required int itemLength,
    required String bestSellerName,
    bool isLoadMore = false,
  }) {
    return bookService.getBooks(
        offset: isLoadMore ? itemLength : 0, bestSellerName: bestSellerName);
  }
}
