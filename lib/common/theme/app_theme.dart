import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font_size.dart';
import 'app_geometry.dart';

class AppTheme {
  static TextStyle _w700({required double fontSize, Color? color}) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      );
  static TextStyle _w600({required double fontSize, Color? color}) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle _w500({required double fontSize, Color? color}) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle _w400({required double fontSize, Color? color}) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextTheme _textTheme({required Color color}) => TextTheme(
        // displayLarge: _w400(fontSize: 24, color: color),
        // displayMedium: _w400(fontSize: 22, color: color),
        // displaySmall: _w500(fontSize: 16, color: color),
        headlineLarge: _w600(fontSize: AppSize.size18, color: color),
        headlineMedium: _w700(fontSize: AppSize.size24, color: color),
        headlineSmall: _w400(fontSize: AppSize.size24, color: color),
        titleLarge: _w400(fontSize: AppSize.size22, color: color),
        titleMedium: _w500(fontSize: AppSize.size16, color: color),
        titleSmall: _w500(fontSize: AppSize.size14, color: color),
        bodyLarge: _w400(fontSize: AppSize.size16, color: color),
        bodyMedium: _w400(fontSize: AppSize.size14, color: color),
        bodySmall: _w400(fontSize: AppSize.size12, color: color),
        labelLarge: _w700(fontSize: AppSize.size14, color: color),
        labelMedium: _w500(fontSize: AppSize.size12, color: color),
        labelSmall: _w500(fontSize: AppSize.size11, color: color),
      );

  static TabBarTheme _tabBarTheme({required Color color}) => TabBarTheme(
        indicator: BoxDecoration(
          color: color,
          borderRadius: AppBorderRadius.a10,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.start,
        dividerHeight: 0,
        labelStyle: _w600(fontSize: AppSize.size14, color: AppColors.white),
        unselectedLabelStyle: _w600(
          fontSize: AppSize.size14,
          color: AppColors.blue,
        ),
      );

  static CardTheme _cardTheme() => const CardTheme(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.a5),
      );

  static TooltipThemeData _toolTipTheme({required Color color}) =>
      TooltipThemeData(
        textStyle: _w500(fontSize: 16, color: color),
        triggerMode: TooltipTriggerMode.tap,
        margin: AppEdgeInsets.a20,
        padding: AppEdgeInsets.a10,
      );

  static AppBarTheme _appBarTheme() => AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.blue,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: AppColors.statusBarColor),
        iconTheme: IconThemeData(
          size: AppSize.size24,
          color: AppColors.white,
        ),
        titleTextStyle: _w500(
          fontSize: AppSize.size14,
          color: AppColors.white,
        ),
      );

  static ListTileThemeData _listTileTheme() => const ListTileThemeData(
        dense: true,
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      );

  static InputBorder _outlineInputBorder({required Color borderColor}) =>
      OutlineInputBorder(
        borderRadius: AppBorderRadius.a10,
        borderSide: BorderSide(color: borderColor),
      );

  static InputDecorationTheme _inputDecorationTheme(
      {required Color fillColor, required Color borderColor}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      labelStyle: _w400(fontSize: AppSize.size16, color: borderColor),
      hintStyle:
          _w400(fontSize: AppSize.size16, color: AppColors.textGreyColor),
      contentPadding: AppEdgeInsets.a10,
      focusedBorder: _outlineInputBorder(borderColor: borderColor),
      disabledBorder: _outlineInputBorder(borderColor: AppColors.lightGrey),
      enabledBorder: _outlineInputBorder(borderColor: borderColor),
      errorBorder: _outlineInputBorder(borderColor: AppColors.red),
      focusedErrorBorder: _outlineInputBorder(borderColor: AppColors.red),
    );
  }

  static TextSelectionThemeData _textSelectionThemeData() =>
      const TextSelectionThemeData(cursorColor: AppColors.black);

  static IconThemeData _iconThemeData({required Color color}) => IconThemeData(
        size: AppSize.size24,
        color: color,
      );

  static ExpansionTileThemeData _expansionTileThemeData() =>
      ExpansionTileThemeData(
        collapsedShape:
            const RoundedRectangleBorder(borderRadius: AppBorderRadius.a20),
        shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.a20),
        iconColor: AppColors.black,
        backgroundColor: AppColors.white,
        collapsedBackgroundColor: AppColors.white,
        expansionAnimationStyle: AnimationStyle(duration: Durations.medium4),
        tilePadding: AppEdgeInsets.v5h10,
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          textStyle: _w500(fontSize: AppSize.size14),
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.a10,
          ),
        ),
      );

  static FloatingActionButtonThemeData _floatingActionButtonThemeData() =>
      const FloatingActionButtonThemeData(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        elevation: 2,
      );

  static TextButtonThemeData _textButtonThemeData() => TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: AppColors.black,
          textStyle: _w600(fontSize: AppSize.size14),
        ),
      );

  static SliderThemeData _sliderThemeData() => SliderThemeData(
        activeTrackColor: AppColors.blue,
        inactiveTrackColor: AppColors.lightGrey,
        thumbColor: AppColors.blue,
        overlayColor: AppColors.blue.withOpacity(0.2),
        overlayShape: SliderComponentShape.noThumb,
      );

  static BadgeThemeData _badgeThemeData({
    required Color backgroundColor,
  }) =>
      BadgeThemeData(
        textStyle: _w500(fontSize: AppSize.size10),
        backgroundColor: backgroundColor,
      );

  /// Light Theme
  static ThemeData get lightTheme => ThemeData(
        appBarTheme: _appBarTheme(),
        badgeTheme: _badgeThemeData(backgroundColor: AppColors.blue),
        cardTheme: _cardTheme(),
        colorScheme: const ColorScheme.light(primary: AppColors.lightBlue),
        dividerColor: AppColors.lightGrey,
        elevatedButtonTheme: _elevatedButtonThemeData(),
        expansionTileTheme: _expansionTileThemeData(),
        floatingActionButtonTheme: _floatingActionButtonThemeData(),
        iconTheme: _iconThemeData(color: AppColors.black),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            iconSize: AppSize.size24,
            tapTargetSize: MaterialTapTargetSize.padded,
          ),
        ),
        inputDecorationTheme: _inputDecorationTheme(
          fillColor: AppColors.white,
          borderColor: AppColors.darkGrey,
        ),
        listTileTheme: _listTileTheme(),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.blue),
        scaffoldBackgroundColor: AppColors.grey,
        sliderTheme: _sliderThemeData(),
        tabBarTheme: _tabBarTheme(color: AppColors.blue),
        textButtonTheme: _textButtonThemeData(),
        textSelectionTheme: _textSelectionThemeData(),
        textTheme: _textTheme(color: AppColors.black),
        tooltipTheme: _toolTipTheme(color: AppColors.white),
      );
}
