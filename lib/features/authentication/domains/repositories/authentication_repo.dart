import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repo.g.dart';

@riverpod
AuthenticationRepo authenticationRepo(ref) {
  return AuthenticationRepoImpl();
}

abstract class AuthenticationRepo {
  Future<ApiResult<UserAuthResult>> signUp(
      {required String userName,
      required String password,
      required String email});

  Future<ApiResult<UserAuthResult>> confirmUser(
      {required String email, required String confirmationCode});

  Future<ApiResult<UserAuthResult>> signIn(
      {required String userName, required String password});

  Future<ApiResult<bool>> signOut();

  Future<ApiResult<String>> fetchUser();
}
