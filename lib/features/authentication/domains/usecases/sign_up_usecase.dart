import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/application/authentication_service.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_usecase.g.dart';

@riverpod
SignUpUseCase signUpUseCase(ref) {
  return SignUpUseCase(
    service: ref.read(authenticationService),
  );
}

class SignUpUseCase {
  final AuthenticationService service;

  SignUpUseCase({required this.service});

  Future<ApiResult<UserAuthResult>> call({
    required String userName,
    required String password,
    required String email,
  }) {
    return service.signUp(userName: userName, password: password, email: email);
  }
}
