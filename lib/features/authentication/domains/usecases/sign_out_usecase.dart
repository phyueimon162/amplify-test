import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/application/authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_usecase.g.dart';

@riverpod
SignOutUseCase signOutUseCase(ref) {
  return SignOutUseCase(ref.read(authenticationService));
}

class SignOutUseCase {
  final AuthenticationService service;

  SignOutUseCase(this.service);

  Future<ApiResult<bool>> call() {
    return service.signOut();
  }
}
