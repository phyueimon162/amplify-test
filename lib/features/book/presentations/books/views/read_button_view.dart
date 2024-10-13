import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class ReadButtonView extends StatelessWidget {
  const ReadButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensions.w20(context) * 1.2),
      decoration: BoxDecoration(
        color: AppTheme.of(context).tertiary,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppDimensions.r15(context)),
            topLeft: Radius.circular(AppDimensions.r15(context))),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Read".toUpperCase(),
          style: AppTheme.of(context).titleMedium.copyWith(
                color: AppTheme.of(context).accent4,
              ),
        ),
      ),
    );
  }
}
