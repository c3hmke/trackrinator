import 'package:flutter/material.dart';
import 'package:trackrinator/widgets/header.dart';
import 'workout_card.dart';

class HomePage extends StatelessWidget {
  final List<String> items = ['Card 1', 'Card 2'];

  // dummy data for dev
  final List<Map<String, dynamic>> workouts = [
    {
      'title': 'Workout A',
      'date': DateTime(2025, 7, 1),
      'exercises': [
        {'name': 'Squats', 'weight': 60},
        {'name': 'Bench Press', 'weight': 50},
        {'name': 'Barbell Rows', 'weight': 50},
      ]
    },
    {
      'title': 'Workout B',
      'date': DateTime(2025, 7, 28),
      'exercises': [
        {'name': 'Squats', 'weight': 60},
        {'name': 'Military Press', 'weight': 35},
        {'name': 'Deadlifts', 'weight': 60},
      ]
    },
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // sort the workouts so the one which should be done next is on top
    workouts.sort((a, b) => b['date'].compareTo(a['date']));

    return Scaffold(
      appBar: const Header(title: '5x5 Workout Trackrinator'),
      body: ListView(
        children: workouts.map((w) {
          final DateTime date = w['date'];
          final String formattedDate = '${date.month.toString().padLeft(2, '0')} / ${date.day.toString().padLeft(2, '0')}';

          return WorkoutCard(
            title: w['title'],
            lastCompletedDate: formattedDate,
            exercises: (w['exercises'] as List)
                .map((e) => {
                  'name': e['name'].toString(),
                  'weight': e['weight'].toString(),
                })
                .toList(),
          );
        }).toList(),
      )
    );
  }
}