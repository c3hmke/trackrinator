import 'package:flutter/material.dart';

class Pill extends StatelessWidget implements PreferredSizeWidget {
  final Text text;
  final Color color;

  const Pill({ required this.text, required this.color, super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),
      child: text
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}