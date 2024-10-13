import 'dart:math';

import 'package:amplify/common/presentations/custom_widgets/page_background/custom_clipper.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: AppDimensions.height(context) * .5,
          width: AppDimensions.width(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.of(context).accent1,
                AppTheme.of(context).primary,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
