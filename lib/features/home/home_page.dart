import 'package:flutter/material.dart';
import 'package:trackrinator/widgets/header.dart';
import 'home_card.dart';

class HomePage extends StatelessWidget {
  final List<String> items = ['Card 1', 'Card 2'];

  // dummy data for display
  final List<Map<String, String>> dummyExercises = [
    {'name': 'Foo1', 'weight': '50'},
    {'name': 'Foo2', 'weight': '60'},
    {'name': 'Foo3', 'weight': '70'},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: '5x5 Workout Trackrinator'),
      body: ListView(
        children: [
          WorkoutCard(title: 'Workout A', lastCompletedDate: '01 Aug', exercises: dummyExercises),
          WorkoutCard(title: 'Workout B', lastCompletedDate: '28 Jul', exercises: dummyExercises),
        ],
      ),
    );
  }
}