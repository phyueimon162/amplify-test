// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static AppTheme of(BuildContext context) {
    return LightModeTheme(context);
  }

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;
  late Typography typography;

  TextStyle get displayLarge => typography.displayLarge;
  TextStyle get displayMedium => typography.displayMedium;
  TextStyle get displaySmall => typography.displaySmall;
  TextStyle get headlineLarge => typography.headlineLarge;
  TextStyle get headlineMedium => typography.headlineMedium;
  TextStyle get headlineSmall => typography.headlineSmall;
  TextStyle get titleLarge => typography.titleLarge;
  TextStyle get titleMedium => typography.titleMedium;
  TextStyle get titleSmall => typography.titleSmall;
  TextStyle get labelLarge => typography.labelLarge;
  TextStyle get labelMedium => typography.labelMedium;
  TextStyle get labelSmall => typography.labelSmall;
  TextStyle get bodyLarge => typography.bodyLarge;
  TextStyle get bodyMedium => typography.bodyMedium;
  TextStyle get bodySmall => typography.bodySmall;

  ThemeData get materialThemeData => ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: secondaryBackground,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
        ),
        colorScheme: ColorScheme(
          primary: primary,
          secondary: secondary,
          surface: primaryBackground,
          error: error,
          onPrimary: primaryText,
          onSecondary: secondaryText,
          onSurface: primaryText,
          onError: error,
          brightness: Brightness.light,
        ),
      );
}

class LightModeTheme extends AppTheme {
  LightModeTheme(BuildContext context) {
    primary = const Color(0xfff7892b);
    secondary = const Color(0xFF66A15F);
    tertiary = const Color(0xFF000000);
    alternate = const Color(0xFFF3F3F3);
    primaryText = const Color(0xFF34283E);
    secondaryText = const Color(0xFF605A65);
    primaryBackground = const Color(0xFFFFFBF5);
    secondaryBackground = const Color(0xFFFFFFFF);
    accent1 = const Color(0xFFE7B944);
    accent2 = const Color(0xffdf8e33);
    accent3 = const Color(0xFFCE3E3E);
    accent4 = const Color(0xCCFFFFFF);
    success = const Color(0xFF249689);
    warning = const Color(0xFFF9CF58);
    error = const Color(0xFFFF5963);
    info = const Color(0xFFFFFFFF);
    typography = ThemeTypography(this, context);
  }
}

abstract class Typography {
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;
  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;
  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme, this.context);

  final AppTheme theme;
  final BuildContext context;

  TextStyle get displayLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
      );
  TextStyle get displayMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
      );
  TextStyle get displaySmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
      );
  TextStyle get headlineLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
      );
  TextStyle get headlineMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
      );
  TextStyle get headlineSmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
      );
  TextStyle get titleLarge => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
      );
  TextStyle get titleMedium => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
      );
  TextStyle get titleSmall => TextStyle(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
      );
  TextStyle get labelLarge => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
      );
  TextStyle get labelMedium => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
      );
  TextStyle get labelSmall => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
      );
  TextStyle get bodyLarge => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
      );
  TextStyle get bodyMedium => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
      );
  TextStyle get bodySmall => TextStyle(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
      );
}
