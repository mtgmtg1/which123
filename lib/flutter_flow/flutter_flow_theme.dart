// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color unset;
  late Color sub1;
  late Color sub2;
  late Color main1;
  late Color main2;
  late Color main3;
  late Color backG1;
  late Color backG2;
  late Color primaryBtnText;
  late Color lineColor;
  late Color customColor2;
  late Color customColor1;
  late Color customColor3;
  late Color black600;
  late Color textColor;
  late Color white;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF4B39EF);
  late Color secondaryColor = const Color(0xFF39D2C0);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xC2FFFFFF);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);

  late Color unset = Color(0x00FFFFFF);
  late Color sub1 = Color(0xFFD0BEB2);
  late Color sub2 = Color(0xFFC67F3D);
  late Color main1 = Color(0xFFFFAC00);
  late Color main2 = Color(0xFFFFD200);
  late Color main3 = Color(0xFFBBDD00);
  late Color backG1 = Color(0x5A000000);
  late Color backG2 = Color(0x60FFFFFF);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color customColor2 = Color(0xFF3E444A);
  late Color customColor1 = Color(0xFFF58787);
  late Color customColor3 = Color(0xFF60BCCF);
  late Color black600 = Color(0xFF090F13);
  late Color textColor = Color(0xFF1E2429);
  late Color white = Color(0xFFFFFFFF);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'gmarket';
  TextStyle get title1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 27,
      );
  String get title2Family => 'gmarket';
  TextStyle get title2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  String get title3Family => 'gmarket';
  TextStyle get title3 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 21,
      );
  String get subtitle1Family => 'gmarket';
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'gmarket';
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  String get bodyText1Family => 'gmarket';
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  String get bodyText2Family => 'gmarket';
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'gmarket';
  TextStyle get title1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 29,
      );
  String get title2Family => 'gmarket';
  TextStyle get title2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 26,
      );
  String get title3Family => 'gmarket';
  TextStyle get title3 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 23,
      );
  String get subtitle1Family => 'gmarket';
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  String get subtitle2Family => 'gmarket';
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get bodyText1Family => 'gmarket';
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  String get bodyText2Family => 'gmarket';
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'gmarket';
  TextStyle get title1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 35,
      );
  String get title2Family => 'gmarket';
  TextStyle get title2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 31,
      );
  String get title3Family => 'gmarket';
  TextStyle get title3 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 27,
      );
  String get subtitle1Family => 'gmarket';
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 23,
      );
  String get subtitle2Family => 'gmarket';
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  String get bodyText1Family => 'gmarket';
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get bodyText2Family => 'gmarket';
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'gmarket',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
