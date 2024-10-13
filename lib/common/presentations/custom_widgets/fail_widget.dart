import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:flutter/material.dart';

class FailWidget extends StatelessWidget {
  final Function? _onTap;
  final String message;
  final bool? showRefreshBtn;
  final Color? btnColor;

  const FailWidget(this._onTap, this.message,
      {super.key, this.showRefreshBtn, this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oops!',
            style: AppTheme.of(context)
                .labelSmall
                .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: AppDimensions.h5(context)),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTheme.of(context)
                .labelMedium
                .copyWith(color: Colors.grey[500]),
          ),
          SizedBox(height: AppDimensions.w20(context)),
          showRefreshBtn ?? true
              ? IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: AppTheme.of(context).accent1,
                    size: AppDimensions.i16(context),
                  ),
                  onPressed: () {
                    if (_onTap != null) {
                      _onTap();
                    }
                  })
              : const SizedBox(),
        ],
      ),
    );
  }
}
