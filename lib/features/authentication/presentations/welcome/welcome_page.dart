import 'package:amplify/common/presentations/custom_widgets/page_background/gradient_page_background.dart';
import 'package:amplify/features/authentication/presentations/views/title_widget.dart';
import 'package:amplify/features/authentication/presentations/welcome/views/sign_in_btn.dart';
import 'package:amplify/features/authentication/presentations/welcome/views/sign_up_btn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, this.title});

  final String? title;

  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: GradientPageBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleWidget(highlightColor: Colors.white),
              SizedBox(height: 80),
              SignInBtn(),
              SizedBox(height: 20),
              SignUpBtn(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
