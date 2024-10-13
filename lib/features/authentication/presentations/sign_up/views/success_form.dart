import 'package:amplify/common/presentations/custom_widgets/buttons/custom_elevated_button.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:amplify/features/authentication/presentations/sign_in/sign_in_page.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_controller.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuccessForm extends ConsumerStatefulWidget {
  const SuccessForm({super.key});

  @override
  ConsumerState<SuccessForm> createState() => _ConfirmSignUpFormState();
}

class _ConfirmSignUpFormState extends ConsumerState<SuccessForm> {
  @override
  Widget build(BuildContext context) {
    SignUpState signUpState = ref.watch(signUpControllerProvider);

    return Column(
      children: [
        Text('Account created successfully! Please login to continue.',
            textAlign: TextAlign.center,
            style: AppTheme.of(context).titleMedium),
        SizedBox(height: AppDimensions.h40(context)),
        CustomElevatedButton(
          label: 'Go to Login',
          state: signUpState.actionState.state,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.signInPage, (route) => route is SignInPage);
          },
        ),
      ],
    );
  }
}
