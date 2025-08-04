import 'package:flutter/material.dart';
import 'package:trackrinator/widgets/header.dart';
import 'package:trackrinator/models/workout.dart';
import 'workout_card.dart';

class HomePage extends StatelessWidget {
  final List<String> items = ['Card 1', 'Card 2'];

  // dummy data for dev
  final workouts = [
    Workout(
      title: 'Workout A',
      lastCompletedAt: DateTime(2025, 7, 1),
      exercises: [
        Exercise(name: 'Squats', weight: 60),
        Exercise(name: 'Bench Press', weight: 50),
        Exercise(name: 'Barbell Rows', weight: 50),
      ]
    ),
    Workout(
      title: 'Workout B',
      lastCompletedAt: DateTime(2025, 7, 28),
      exercises: [
        Exercise(name: 'Squats', weight: 60),
        Exercise(name: 'Military Press', weight: 35),
        Exercise(name: 'Deadlifts', weight: 60),
      ]
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // sort the workouts so the one which should be done next is on top
    workouts.sort((a, b) => b.lastCompletedAt.compareTo(a.lastCompletedAt));

    return Scaffold(
      appBar: const Header(title: '5x5 Workout Trackrinator'),
      body: ListView(
        children: workouts.map((w) => WorkoutCard(workout: w)).toList(),
      )
    );
  }
}