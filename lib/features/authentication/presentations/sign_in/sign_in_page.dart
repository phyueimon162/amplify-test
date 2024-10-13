import 'package:amplify/common/presentations/custom_widgets/buttons/custom_elevated_button.dart';
import 'package:amplify/common/presentations/custom_widgets/labeled_widget.dart';
import 'package:amplify/common/presentations/custom_widgets/page_background/bezier_page_background.dart';
import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:amplify/core/util/enums/auth_status.dart';
import 'package:amplify/core/util/validators/validator.dart';
import 'package:amplify/features/authentication/presentations/sign_in/controllers/sign_in_controller.dart';
import 'package:amplify/features/authentication/presentations/sign_up/sign_up_page.dart';
import 'package:amplify/features/authentication/presentations/views/title_widget.dart';
import 'package:amplify/features/book/presentations/books/books_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  final String? title;

  const SignInPage({super.key, this.title});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listenManual(signInControllerProvider, (prev, next) {
      if (next.actionState.state == AState.actionFail) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.actionState.msg)),
        );
      } else if (next.actionState.state == AState.actionSuccess &&
          next.signInResult?.status == AuthStatus.done) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.booksPage, (route) => route is BooksPage);
      }
    });
  }

  Widget _signUpPrompt() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: AppTheme.of(context).bodyMedium,
          ),
          const SizedBox(width: 10),
          Text('Register',
              style: AppTheme.of(context).bodyMedium.copyWith(
                  color: AppTheme.of(context).primary,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
        border: InputBorder.none,
        fillColor: AppTheme.of(context).alternate,
        filled: true);

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: AppDimensions.screenHeight(context) * 0.2),
                  TitleWidget(highlightColor: AppTheme.of(context).primary),
                  SizedBox(height: AppDimensions.h40(context)),
                  LabeledWidget(
                    label: "Email",
                    child: TextFormField(
                      controller: emailController,
                      validator: Validator.emailValidator,
                      decoration: inputDecoration,
                    ),
                  ),
                  LabeledWidget(
                    label: "Password",
                    child: TextFormField(
                      controller: passwordController,
                      validator: Validator.nullCheckValidator,
                      obscureText: true,
                      decoration: inputDecoration,
                    ),
                  ),
                  SizedBox(height: AppDimensions.h20(context)),
                  CustomElevatedButton(
                    label: 'Login',
                    state:
                        ref.watch(signInControllerProvider).actionState.state,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      ref.read(signInControllerProvider.notifier).onSignInEvent(
                          userName: emailController.text,
                          password: passwordController.text);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.w10(context)),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: AppTheme.of(context).bodyMedium,
                    ),
                  ),
                  SizedBox(height: AppDimensions.h40(context)),
                  _signUpPrompt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
