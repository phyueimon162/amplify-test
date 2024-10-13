import 'package:amplify/features/book/data/models/nyt_response_model.dart';
import 'package:amplify/features/book/domains/entities/book.dart';

class BookResponse {
  final int totalCount;
  final List<Book> books;

  BookResponse({
    required this.totalCount,
    required this.books,
  });

  factory BookResponse.fromModel(NYTResponse response) {
    return BookResponse(
        totalCount: response.numResults,
        books: response.results.books
            .map((e) => Book(
                rank: e.rank,
                description: e.description,
                price: e.price,
                title: e.title,
                author: e.author,
                bookImage: e.bookImage))
            .toList());
  }
}
