import 'package:amplify/common/presentations/custom_widgets/page_background/bezier_container.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:flutter/material.dart';

class BezierPageBackground extends StatelessWidget {
  final Widget child;

  const BezierPageBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: AppDimensions.screenHeight(context),
      width: AppDimensions.screenWidth(context),
      child: Stack(children: <Widget>[
        Positioned(
            top: -AppDimensions.screenHeight(context) * .15,
            right: -AppDimensions.screenWidth(context) * .4,
            child: const BezierContainer()),
        Positioned.fill(
          child: child, // Ensure child stretches to fill available space
        ),
      ]),
    );
  }
}
