import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class NoRecord extends StatelessWidget {
  final Function _onTap;
  final String? message;
  final bool showRefreshBtn;

  const NoRecord(this._onTap,
      {super.key, this.message, this.showRefreshBtn = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty.png", width: 80, height: 80),
          Text(
            message ?? "No Record",
            style: AppTheme.of(context)
                .labelMedium
                .copyWith(color: Colors.grey[500]),
          ),
          showRefreshBtn
              ? IconButton(
                  tooltip: "Refresh",
                  icon: Icon(
                    Icons.refresh,
                    color: AppTheme.of(context).accent1,
                    size: AppDimensions.i16(context),
                  ),
                  onPressed: () {
                    _onTap();
                  })
              : const SizedBox(),
        ],
      ),
    );
  }
}
