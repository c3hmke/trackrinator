import 'package:flutter/material.dart';
import 'package:trackrinator/widgets/header.dart';
import 'home_card.dart';

class HomePage extends StatelessWidget {
  final List<String> items = ['Card 1', 'Card 2'];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: '5x5 Workout Trackrinator'),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => HomeCard(title: items[index]),
      ),
    );
  }
}