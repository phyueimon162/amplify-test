import 'package:amplify/core/state_models/action_state.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final ActionState actionState;
  final UserAuthResult? signInResult;

  const SignInState({required this.actionState, this.signInResult});

  SignInState.initial() : this(actionState: ActionState());

  SignInState copyWith(
      {ActionState? actionState, UserAuthResult? signInResult}) {
    return SignInState(
      actionState: actionState ?? ActionState(),
      signInResult: signInResult ?? this.signInResult,
    );
  }

  @override
  List<Object?> get props => [actionState, signInResult];
}
