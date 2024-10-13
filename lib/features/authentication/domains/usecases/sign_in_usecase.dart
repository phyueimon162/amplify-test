import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/application/authentication_service.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_usecase.g.dart';

@riverpod
SignInUseCase signInUseCase(ref) {
  return SignInUseCase(ref.read(authenticationService));
}

class SignInUseCase {
  final AuthenticationService service;

  SignInUseCase(this.service);

  Future<ApiResult<UserAuthResult>> call(
      {required String userName, required String password}) {
    return service.signIn(userName: userName, password: password);
  }
}
