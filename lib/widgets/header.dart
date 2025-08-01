import 'package:flutter/material.dart';
import 'package:trackrinator/app/theme.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Header({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.colors.primary,
      centerTitle: true,
      title: Text(title, style: AppTheme.text.titleBar),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}