import 'package:equatable/equatable.dart';
import 'package:amplify/core/state_models/action_state.dart';

class AccountState extends Equatable {
  final ActionState actionState;

  const AccountState({required this.actionState});

  AccountState.initial() : this(actionState: ActionState());

  AccountState copyWith({ActionState? actionState}) {
    return AccountState(
      actionState: actionState ?? ActionState(),
    );
  }

  @override
  List<Object?> get props => [actionState];
}
