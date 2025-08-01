import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;

  const HomeCard({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(title: Text(title)),
    );
  }
}
