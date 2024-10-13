import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class GradientPageBackground extends StatelessWidget {
  final Widget child;

  const GradientPageBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.w20(context)),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2)
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.of(context).accent1,
              AppTheme.of(context).primary
            ]),
      ),
      child: child,
    );
  }
}
