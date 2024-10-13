import 'package:amplify/core/network/services/network_exceptions.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';

class ActionState {
  AState state;
  String msg;

  ActionState(
      {this.state = AState.actionInit, this.msg = "", NetworkExceptions? err}) {
    msg = err != null ? NetworkExceptions.getErrorMessage(err) : msg;
    state = err != null ? AState.actionFail : state;
  }
}
