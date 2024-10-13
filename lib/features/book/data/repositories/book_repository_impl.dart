import 'package:amplify/core/network/api_route.dart';
import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/core/network/services/dio_client.dart';
import 'package:amplify/core/network/services/network_exceptions.dart';
import 'package:amplify/features/book/data/models/nyt_response_model.dart';
import 'package:amplify/features/book/domains/entities/book_response.dart';
import 'package:amplify/features/book/domains/repositories/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  @override
  Future<ApiResult<BookResponse>> fetchLatestBook(
      {required int offset, required String bestSellerName}) async {
    try {
      final response = await DioClient()
          .get(ApiRoute.getLatestBookRoute(offset, bestSellerName));
      NYTResponse nytResponse = NYTResponse.fromJson(response);
      return ApiResult.success(BookResponse.fromModel(nytResponse));
    } catch (e) {
      return ApiResult.failure(await NetworkExceptions.getDioException(e));
    }
  }
}
