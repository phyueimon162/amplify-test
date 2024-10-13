import 'package:amplify/core/state_models/action_state.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final ActionState actionState;
  final UserAuthResult? signUpResult;
  final String? email;

  const SignUpState({required this.actionState, this.signUpResult, this.email});

  SignUpState.initial() : this(actionState: ActionState());

  SignUpState copyWith(
      {ActionState? actionState, UserAuthResult? signUpResult, String? email}) {
    return SignUpState(
      actionState: actionState ?? ActionState(),
      signUpResult: signUpResult ?? this.signUpResult,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [actionState, signUpResult, email];
}
