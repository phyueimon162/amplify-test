import 'package:equatable/equatable.dart';
import 'package:amplify/core/network/services/network_exceptions.dart';

import 'enums/page_state_enum.dart';

class PageState extends Equatable {
  final PState state;
  final String msg;

  const PageState.init({PState? state, this.msg = ""}) : state = PState.init;

  PageState({this.state = PState.init, String? msg, NetworkExceptions? err})
      : msg =
            err != null ? NetworkExceptions.getErrorMessage(err) : (msg ?? "");

  @override
  List<Object?> get props => [state, msg];
}
