import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class RankView extends StatelessWidget {
  final String rank;

  const RankView(this.rank, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.w5(context)),
      decoration: BoxDecoration(
        color: AppTheme.of(context).accent4,
        borderRadius: BorderRadius.circular(AppDimensions.r15(context)),
      ),
      child: Column(
        children: [
          Icon(Icons.stars, color: AppTheme.of(context).accent1),
          Text(
            rank,
            maxLines: 1,
            style: AppTheme.of(context).bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
