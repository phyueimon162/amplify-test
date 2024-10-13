import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/core/state_models/action_state.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:amplify/features/authentication/domains/usecases/sign_in_usecase.dart';
import 'package:amplify/features/authentication/presentations/sign_in/controllers/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  late final SignInUseCase signInUseCase;

  @override
  SignInState build() {
    signInUseCase = ref.read(signInUseCaseProvider);
    return SignInState.initial();
  }

  void onSignInEvent(
      {required String userName, required String password}) async {
    state =
        state.copyWith(actionState: ActionState(state: AState.actionLoading));
    final ApiResult<UserAuthResult> response =
        await signInUseCase(userName: userName, password: password);
    response.when(success: (UserAuthResult result) {
      state = state.copyWith(
        actionState: ActionState(state: AState.actionSuccess),
        signInResult: result,
      );
    }, failure: (e) {
      state = state.copyWith(
          actionState: ActionState(state: AState.actionFail, err: e));
    });
  }
}
