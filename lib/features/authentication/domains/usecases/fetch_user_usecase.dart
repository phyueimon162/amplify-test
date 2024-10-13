import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/application/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_user_usecase.g.dart';

@riverpod
FetchUserUseCase fetchUserUseCase(ref) {
  return FetchUserUseCase(ref.read(authenticationService));
}

class FetchUserUseCase {
  final AuthenticationService service;

  FetchUserUseCase(this.service);

  Future<ApiResult<String>> call() {
    return service.fetchUser();
  }
}
