import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:flutter/material.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.signUpPage);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: AppDimensions.h10(context)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimensions.r5(context))),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: AppTheme.of(context).titleMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
