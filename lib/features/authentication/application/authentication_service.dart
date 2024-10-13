import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:amplify/features/authentication/domains/repositories/authentication_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_service.g.dart';

@riverpod
AuthenticationService authenticationService(ref) {
  return AuthenticationService(ref.read(authenticationRepo));
}

class AuthenticationService {
  final AuthenticationRepo authenticationRepo;

  AuthenticationService(this.authenticationRepo);

  Future<ApiResult<UserAuthResult>> signIn(
      {required String userName, required String password}) {
    return authenticationRepo.signIn(userName: userName, password: password);
  }

  Future<ApiResult<UserAuthResult>> signUp(
      {required String userName,
      required String password,
      required String email}) {
    return authenticationRepo.signUp(
        userName: userName, password: password, email: email);
  }

  Future<ApiResult<UserAuthResult>> confirmUser(
      {required String email, required String confirmationCode}) {
    return authenticationRepo.confirmUser(
        email: email, confirmationCode: confirmationCode);
  }

  Future<ApiResult<bool>> signOut() {
    return authenticationRepo.signOut();
  }

  Future<ApiResult<String>> fetchUser() {
    return authenticationRepo.fetchUser();
  }
}
