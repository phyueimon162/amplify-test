import 'package:amplify/common/presentations/custom_widgets/buttons/custom_elevated_button.dart';
import 'package:amplify/common/presentations/custom_widgets/labeled_widget.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/util/validators/validator.dart';
import 'package:amplify/features/authentication/presentations/sign_in/sign_in_page.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_controller.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
        border: InputBorder.none,
        fillColor: AppTheme.of(context).alternate,
        filled: true);

    SignUpState signUpState = ref.watch(signUpControllerProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          LabeledWidget(
            label: "Username",
            child: TextFormField(
              controller: userNameController,
              validator: Validator.nullCheckValidator,
              decoration: inputDecoration,
            ),
          ),
          LabeledWidget(
            label: "Email Id",
            child: TextFormField(
              controller: emailController,
              validator: Validator.emailValidator,
              decoration: inputDecoration,
            ),
          ),
          LabeledWidget(
            label: "Password",
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '* required';
                } else if (value != cPasswordController.text) {
                  return 'Password does not match';
                }
                return null;
              },
              controller: passwordController,
              decoration: inputDecoration,
            ),
          ),
          LabeledWidget(
            label: "Confirm Password",
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '* required';
                } else if (value != passwordController.text) {
                  return 'Password does not match';
                }
                return null;
              },
              controller: cPasswordController,
              decoration: inputDecoration,
            ),
          ),
          SizedBox(height: AppDimensions.h20(context)),
          CustomElevatedButton(
            label: 'Register Now',
            state: signUpState.actionState.state,
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              ref.read(signUpControllerProvider.notifier).onSignUpEvent(
                  userName: userNameController.text,
                  password: passwordController.text,
                  cPassword: cPasswordController.text,
                  email: emailController.text);
            },
          ),
          SizedBox(height: AppDimensions.h20(context)),
          _signInPrompt(context),
        ],
      ),
    );
  }

  Widget _signInPrompt(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: AppTheme.of(context).bodyMedium,
          ),
          const SizedBox(width: 10),
          Text(
            'Login',
            style: AppTheme.of(context).bodyMedium.copyWith(
                color: AppTheme.of(context).primary,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
