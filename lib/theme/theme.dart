import 'package:flutter/material.dart';
import 'package:liam_game/theme/colors.dart';

final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlack,
      brightness: Brightness.light,
    ),
    fontFamily: 'InstrumentSans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(AppColors.primaryBlack),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
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
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ));
