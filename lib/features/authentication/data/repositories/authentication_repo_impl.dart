import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/core/network/services/network_exceptions.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:amplify/features/authentication/domains/repositories/authentication_repo.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  @override
  Future<ApiResult<UserAuthResult>> signIn(
      {required String userName, required String password}) async {
    try {
      SignInResult signInResult = await Amplify.Auth.signIn(
        username: userName,
        password: password,
      );
      return ApiResult.success(UserAuthResult.fromSignInResult(signInResult));
    } on AuthException catch (e) {
      return ApiResult.failure(NetworkExceptions.defaultError(e.message, 500));
    }
  }

  @override
  Future<ApiResult<UserAuthResult>> signUp(
      {required String userName,
      required String password,
      required String email}) async {
    try {
      final userAttributes = {
        AuthUserAttributeKey.name: userName,
      };
      SignUpResult signUpResult = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      return ApiResult.success(UserAuthResult.fromSignUpResult(signUpResult));
    } on AuthException catch (e) {
      return ApiResult.failure(NetworkExceptions.defaultError(e.message, 500));
    }
  }

  @override
  Future<ApiResult<UserAuthResult>> confirmUser({
    required String email,
    required String confirmationCode,
  }) async {
    try {
      SignUpResult signUpResult = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );
      return ApiResult.success(UserAuthResult.fromSignUpResult(signUpResult));
    } on AuthException catch (e) {
      return ApiResult.failure(NetworkExceptions.defaultError(e.message, 500));
    }
  }

  @override
  Future<ApiResult<bool>> signOut() async {
    SignOutResult result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      return const ApiResult.success(true);
    } else if (result is CognitoFailedSignOut) {
      return ApiResult.failure(
          NetworkExceptions.defaultError(result.exception.message, 500));
    } else {
      return const ApiResult.failure(
          NetworkExceptions.defaultError('Unknown error', 500));
    }
  }

  @override
  Future<ApiResult<String>> fetchUser() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final result = await cognitoPlugin.fetchAuthSession();
      final identityId = result.identityIdResult.value;
      return ApiResult.success(identityId);
    } on AuthException {
      return const ApiResult.failure(
          NetworkExceptions.defaultError('Unknown error', 500));
    }
  }
}
