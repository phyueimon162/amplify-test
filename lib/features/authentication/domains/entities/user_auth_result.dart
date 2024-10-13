import 'package:amplify/core/util/enums/auth_status.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class UserAuthResult {
  final AuthStatus status;
  final String? destination;
  final String? mediumName;

  UserAuthResult({required this.status, this.destination, this.mediumName});

  factory UserAuthResult.fromSignInResult(SignInResult signInResult) {
    return UserAuthResult(
      status: signInResult.nextStep.signInStep == AuthSignInStep.done
          ? AuthStatus.done
          : AuthStatus.notDetermined,
    );
  }

  factory UserAuthResult.fromSignUpResult(SignUpResult signUpResult) {
    return UserAuthResult(
      status: signUpResult.nextStep.signUpStep == AuthSignUpStep.done
          ? AuthStatus.done
          : signUpResult.nextStep.signUpStep == AuthSignUpStep.confirmSignUp
              ? AuthStatus.confirmSignUp
              : AuthStatus.notDetermined,
      destination: signUpResult.nextStep.codeDeliveryDetails?.destination,
      mediumName:
          signUpResult.nextStep.codeDeliveryDetails?.deliveryMedium.name,
    );
  }
}
