import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify/core/network/amplify/amplify_config.dart';

class AmplifyService {
  static Future<void> configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(AmplifyConfiguration.amplifyconfig);
    } on Exception catch (e) {
      safePrint("Could not configure Amplify $e");
    }
  }

  static Future<bool> fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint('Error retrieving auth session: ${result.isSignedIn}');
      return result.isSignedIn;
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
      return false;
    }
  }
}
