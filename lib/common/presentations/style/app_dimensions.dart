import 'package:flutter/material.dart';

class AppDimensions {
  static final Map<String, double> _cache = {};

  static double _calculate(
      BuildContext context, double dividedBy, bool useHeight) {
    String key = '${useHeight ? 'h' : 'w'}_$dividedBy';
    if (_cache.containsKey(key)) {
      return _cache[key]!;
    }
    final size = MediaQuery.of(context).size;
    double value = (useHeight ? size.height : size.width) / dividedBy;
    _cache[key] = value;
    return value;
  }

  static double height(BuildContext context, {double dividedBy = 1}) =>
      _calculate(context, dividedBy, true);

  static double width(BuildContext context, {double dividedBy = 1}) =>
      _calculate(context, dividedBy, false);

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  static double screenHeight(BuildContext context) => height(context);
  static double screenWidth(BuildContext context) => width(context);

  // Heights
  static double h5(BuildContext context) => height(context, dividedBy: 143);
  static double h10(BuildContext context) => height(context, dividedBy: 71.5);
  static double h15(BuildContext context) => height(context, dividedBy: 47.67);
  static double h20(BuildContext context) => height(context, dividedBy: 35.75);
  static double h30(BuildContext context) => height(context, dividedBy: 23.83);
  static double h40(BuildContext context) => height(context, dividedBy: 17.88);

  // Widths
  static double w5(BuildContext context) => width(context, dividedBy: 143);
  static double w10(BuildContext context) => width(context, dividedBy: 71.5);
  static double w20(BuildContext context) => width(context, dividedBy: 35.75);
  static double w30(BuildContext context) => width(context, dividedBy: 23.83);

  // Radius - Adjusted for more appropriate sizing across devices
  static double r5(BuildContext context) => height(context, dividedBy: 100.0);
  static double r10(BuildContext context) => height(context, dividedBy: 50.0);
  static double r15(BuildContext context) => height(context, dividedBy: 33.33);
  static double r20(BuildContext context) => height(context, dividedBy: 25.0);
  static double r30(BuildContext context) => height(context, dividedBy: 16.67);

  // Sizes (can be used for both width and height)
  static double s18(BuildContext context) => height(context, dividedBy: 39.72);
  static double s24(BuildContext context) => height(context, dividedBy: 29.79);
  static double s25(BuildContext context) => height(context, dividedBy: 28.6);

  // Icon Sizes - Adjusted for better scaling across devices
  static double i16(BuildContext context) => height(context, dividedBy: 50);
  static double i24(BuildContext context) => height(context, dividedBy: 33.33);
  static double i32(BuildContext context) => height(context, dividedBy: 25);

  // Responsive value based on screen width
  static T responsive<T>(
    BuildContext context, {
    required T small,
    required T medium,
    required T large,
  }) {
    double width = screenWidth(context);
    if (width < 600) return small;
    if (width < 1200) return medium;
    return large;
  }
}
