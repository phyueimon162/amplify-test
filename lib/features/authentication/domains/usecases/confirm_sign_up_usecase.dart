import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/application/authentication_service.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'confirm_sign_up_usecase.g.dart';

@riverpod
ConfirmSignUpUseCase confirmSignUpUseCase(ref) {
  return ConfirmSignUpUseCase(
    service: ref.read(authenticationService),
  );
}

class ConfirmSignUpUseCase {
  final AuthenticationService service;

  ConfirmSignUpUseCase({required this.service});

  Future<ApiResult<UserAuthResult>> call({
    required String email,
    required String confirmationCode,
  }) {
    return service.confirmUser(
      email: email,
      confirmationCode: confirmationCode,
    );
  }
}
