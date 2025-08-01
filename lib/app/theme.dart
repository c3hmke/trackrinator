import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // prevent initialization

  static _AppColors get colors => _AppColors();
  static _AppTextStyles get text => _AppTextStyles();
}

class _AppColors {
  final Color primary = Color(0xFF4927F5);
  final Color secondary = Color(0xFFF54927);
  final Color accent = Color(0xFF27F549);
  final Color pText = Color(0xFFFFFFFF);
}

class _AppTextStyles {
  final TextStyle titleBar = TextStyle(
    color: AppTheme.colors.pText, fontSize: 20, fontWeight: FontWeight.w600
  );

  final TextStyle header = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle body = TextStyle(fontSize: 16);
}