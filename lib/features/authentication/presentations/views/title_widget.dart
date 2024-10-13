import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final Color highlightColor;

  const TitleWidget({required this.highlightColor, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'A',
          style: AppTheme.of(context)
              .displaySmall
              .copyWith(color: highlightColor, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: 'mpl',
              style: AppTheme.of(context)
                  .displaySmall
                  .copyWith(color: Colors.black),
            ),
            const TextSpan(text: 'ify'),
          ]),
    );
  }
}
