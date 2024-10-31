import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

class AppStyle {
  static const displayLarge = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.bold,
  );

  static const titleMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryBlack,
  );

  static const labelLarge = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600
  );
  static const labelMedium = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.white,);

  static const labelSmall = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w200);
}

final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlack,
      brightness: Brightness.light,
    ),
    fontFamily: 'InstrumentSans',
    textTheme: const TextTheme(
      displayLarge: AppStyle.displayLarge,
      titleMedium: AppStyle.titleMedium,
      labelLarge: AppStyle.labelLarge,
      labelMedium: AppStyle.labelMedium,
      labelSmall: AppStyle.labelSmall,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(AppColors.primaryBlack),
        foregroundColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.white;
          }
          return AppColors.primaryBlack;
        }),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryBlack,
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 15,
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primaryBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      hintStyle: AppStyle.labelMedium.copyWith(color: AppColors.white),
      labelStyle: AppStyle.labelSmall.copyWith(color: AppColors.yellow),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffcccccc)),
        borderRadius: BorderRadius.circular(32),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffcccccc)),
        borderRadius: BorderRadius.circular(32),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryBlack),
        borderRadius: BorderRadius.circular(32),
      ),
      focusColor: AppColors.green,
      fillColor: AppColors.primaryBlack,
      filled: true,

    )
);
