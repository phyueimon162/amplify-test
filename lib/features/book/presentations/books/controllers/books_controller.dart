import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/core/state_models/enums/page_state_enum.dart';
import 'package:amplify/core/state_models/page_state.dart';
import 'package:amplify/features/book/domains/entities/book.dart';
import 'package:amplify/features/book/domains/entities/book_response.dart';
import 'package:amplify/features/book/domains/usecases/book_list_usecase.dart';
import 'package:amplify/features/book/presentations/books/controllers/book_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'books_controller.g.dart';

@riverpod
class BooksController extends _$BooksController {
  late final BookListUseCase bookListUseCase;

  @override
  BookState build() {
    bookListUseCase = ref.read(bookListUseCaseProvider);
    state = BookState.initial();
    return BookState.initial();
  }

  Future<void> onFetchBooksEvent({bool isLoadMore = false}) async {
    state = state.copyWith(
        pageState:
            PageState(state: isLoadMore ? PState.loadMore : PState.loading));
    final ApiResult<BookResponse> response = await bookListUseCase(
        isLoadMore: isLoadMore,
        itemLength: state.books.length,
        bestSellerName: "hardcover-fiction");
    response.when(success: (BookResponse response) {
      final List<Book> x = [if (isLoadMore) ...state.books, ...response.books];
      state = state.copyWith(
          books: x,
          totalCount: response.totalCount,
          pageState: PageState(state: PState.ready));
    }, failure: (e) {
      state = state.copyWith(
          pageState: PageState(state: PState.fail, err: e),
          books: isLoadMore ? state.books : []);
    });
  }
}
