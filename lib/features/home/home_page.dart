import 'package:flutter/material.dart';
import 'home_card.dart';

class HomePage extends StatelessWidget {
  final List<String> items = ['Card 1', 'Card 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple App')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => HomeCard(title: items[index]),
      ),
    );
  }
}