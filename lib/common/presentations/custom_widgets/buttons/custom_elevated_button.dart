import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/state_models/enums/action_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final AState state;

  const CustomElevatedButton(
      {required this.label,
      required this.onPressed,
      required this.state,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (state != AState.actionLoading) {
          onPressed();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.symmetric(vertical: AppDimensions.h15(context) * 0.8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.r5(context)),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppTheme.of(context).accent1,
              AppTheme.of(context).primary
            ],
          ),
        ),
        child: SizedBox(
          height: AppDimensions.h20(context),
          child: state != AState.actionLoading
              ? Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white))
              : SpinKitThreeInOut(
                  size: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index.isEven
                            ? AppTheme.of(context).accent1
                            : AppTheme.of(context).primary,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
