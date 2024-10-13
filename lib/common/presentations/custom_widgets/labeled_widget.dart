import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class LabeledWidget extends StatelessWidget {
  final String label;
  final Widget child;

  const LabeledWidget({required this.label, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppDimensions.h5(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: AppTheme.of(context).bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: AppDimensions.h5(context)),
          child,
        ],
      ),
    );
  }
}
