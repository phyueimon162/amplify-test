import 'package:amplify/common/presentations/custom_widgets/page_background/bezier_page_background.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:amplify/core/util/enums/auth_status.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_controller.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_state.dart';
import 'package:amplify/features/authentication/presentations/sign_up/views/confirm_form.dart';
import 'package:amplify/features/authentication/presentations/sign_up/views/sign_up_form.dart';
import 'package:amplify/features/authentication/presentations/sign_up/views/success_form.dart';
import 'package:amplify/features/authentication/presentations/views/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key, this.title});

  final String? title;

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(signUpControllerProvider, (previous, next) {
      if (next.actionState.state == AState.actionFail) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.actionState.msg),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SignUpState signUpState = ref.watch(signUpControllerProvider);

    return BezierPageBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.w20(context),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: AppDimensions.screenHeight(context) * 0.12),
                TitleWidget(highlightColor: AppTheme.of(context).primary),
                SizedBox(height: AppDimensions.h40(context)),
                signUpState.signUpResult?.status == AuthStatus.done
                    ? const SuccessForm()
                    : signUpState.signUpResult?.status ==
                            AuthStatus.confirmSignUp
                        ? ConfirmForm(
                            destination: signUpState.signUpResult!.destination!,
                            mediumName: signUpState.signUpResult!.mediumName!,
                          )
                        : const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
