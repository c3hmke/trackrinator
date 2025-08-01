import 'package:flutter/material.dart';
import 'package:trackrinator/features/home/home_page.dart';

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