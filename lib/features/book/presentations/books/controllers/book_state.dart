import 'package:amplify/core/state_models/page_state.dart';
import 'package:amplify/features/book/domains/entities/book.dart';
import 'package:equatable/equatable.dart';

class BookState extends Equatable {
  final List<Book> books;
  final int totalCount;
  final PageState pageState;

  const BookState(
      {required this.books, required this.totalCount, required this.pageState});

  BookState.initial()
      : this(books: const <Book>[], totalCount: 0, pageState: PageState());

  BookState copyWith(
      {List<Book>? books, int? totalCount, PageState? pageState}) {
    return BookState(
      books: books ?? this.books,
      totalCount: totalCount ?? this.totalCount,
      pageState: pageState ?? this.pageState,
    );
  }

  @override
  List<Object> get props => [books, totalCount, pageState];
}
