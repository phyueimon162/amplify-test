import 'package:amplify/core/network/services/api_result.dart';
import 'package:amplify/core/state_models/action_state.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:amplify/features/authentication/domains/entities/user_auth_result.dart';
import 'package:amplify/features/authentication/domains/usecases/confirm_sign_up_usecase.dart';
import 'package:amplify/features/authentication/domains/usecases/sign_up_usecase.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  late final SignUpUseCase signUpUseCase;
  late final ConfirmSignUpUseCase confirmSignUpUseCase;

  @override
  SignUpState build() {
    signUpUseCase = ref.read(signUpUseCaseProvider);
    confirmSignUpUseCase = ref.read(confirmSignUpUseCaseProvider);
    return SignUpState.initial();
  }

  void onSignUpEvent(
      {required String userName,
      required String password,
      required String cPassword,
      required String email}) async {
    if (password != cPassword) {
      state = state.copyWith(
          actionState: ActionState(
        state: AState.actionFail,
        msg: "Password and Confirm Password should be same",
      ));
      return;
    }
    state =
        state.copyWith(actionState: ActionState(state: AState.actionLoading));
    final ApiResult<UserAuthResult> response = await signUpUseCase(
        userName: userName, password: password, email: email);
    response.when(success: (UserAuthResult result) {
      state = state.copyWith(
        actionState: ActionState(state: AState.actionSuccess),
        signUpResult: result,
        email: email,
      );
    }, failure: (e) {
      state = state.copyWith(
          actionState: ActionState(state: AState.actionFail, err: e));
    });
  }

  void confirmEvent(String confirmationCode) async {
    state =
        state.copyWith(actionState: ActionState(state: AState.actionLoading));
    final ApiResult<UserAuthResult> response = await confirmSignUpUseCase(
        email: state.email!, confirmationCode: confirmationCode);
    response.when(success: (UserAuthResult result) {
      state = state.copyWith(
        actionState: ActionState(state: AState.actionSuccess),
        signUpResult: result,
      );
    }, failure: (e) {
      state = state.copyWith(
          actionState: ActionState(state: AState.actionFail, err: e));
    });
  }
}
