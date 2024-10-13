import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/common/presentations/navigation/app_route.dart';
import 'package:flutter/material.dart';

class SignInBtn extends StatelessWidget {
  const SignInBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.signInPage);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: AppDimensions.h10(context)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.r5(context))),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppTheme.of(context).accent2.withAlpha(100),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.white),
        child: Text(
          'Sign In',
          style: AppTheme.of(context)
              .titleMedium
              .copyWith(color: AppTheme.of(context).primary),
        ),
      ),
    );
  }
}
