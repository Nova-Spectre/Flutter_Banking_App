import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimaryColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextColor),
      bodyMedium: TextStyle(color: AppColors.lightTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
      titleTextStyle: TextStyle(color: AppColors.lightTextColor),
    ),
    iconTheme: IconThemeData(
      color: AppColors.lightTextColor,
    ),
    cardColor: AppColors.lightSecondaryColor,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextColor),
      bodyMedium: TextStyle(color: AppColors.darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryColor,
      titleTextStyle: TextStyle(color: AppColors.darkTextColor),
    ),
    iconTheme: IconThemeData(
      color: AppColors.darkTextColor,
    ),
    cardColor: AppColors.darkPrimaryColor,
  );
}