import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // prevent initialization

  static _AppColors get colors => _AppColors();
  static _AppTextStyles get text => _AppTextStyles();
}

class _AppColors {
  final Color primary = Color(0xFF512DA8);
  final Color pText = Color(0xFFFFFFFF);
}

class _AppTextStyles {
  final TextStyle titleBar = TextStyle(
    color: AppTheme.colors.pText, fontSize: 20, fontWeight: FontWeight.w600
  );
}