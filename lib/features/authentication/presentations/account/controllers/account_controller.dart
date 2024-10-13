import 'package:amplify/core/state_models/action_state.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:amplify/features/authentication/domains/usecases/fetch_user_usecase.dart';
import 'package:amplify/features/authentication/domains/usecases/sign_out_usecase.dart';
import 'package:amplify/features/authentication/presentations/account/controllers/account_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  late final SignOutUseCase signOutUseCase;
  late final FetchUserUseCase fetchUserUseCase;

  @override
  AccountState build() {
    signOutUseCase = ref.read(signOutUseCaseProvider);
    fetchUserUseCase = ref.read(fetchUserUseCaseProvider);
    return AccountState.initial();
  }

  void fetchUser() {
    fetchUserUseCase();
  }

  void signOut() {
    state =
        state.copyWith(actionState: ActionState(state: AState.actionLoading));
    signOutUseCase().then((response) {
      response.when(success: (result) {
        state = state.copyWith(
            actionState: ActionState(state: AState.actionSuccess));
      }, failure: (e) {
        state = state.copyWith(
            actionState: ActionState(state: AState.actionFail, err: e));
      });
    });
  }
}
