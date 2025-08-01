import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'trackrinator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items = ['Card 1', 'Card 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('5x5 Workout Trackrinator'),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}