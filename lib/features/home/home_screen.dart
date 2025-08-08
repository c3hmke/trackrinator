import 'package:flutter/material.dart';
import 'package:trackrinator/features/workout/workout_screen.dart';
import 'package:trackrinator/widgets/header.dart';
import 'package:trackrinator/app/theme.dart';
import 'package:trackrinator/models/workout.dart';
import 'package:trackrinator/models/exercise.dart';
import 'workout_card.dart';

class HomePage extends StatelessWidget {
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
      appBar: const Header(title: '🏋 5x5 Trackrinator 🏋'),
      body: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [

          // Up Next Label
          const Padding (
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Text('Up Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ),

          // Highlighted first card
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: AppTheme.colors.accent)]
            ),
            child: WorkoutCard(workout: workouts.first)
          ),

          // Spacer
          const SizedBox(height: 24),

          // Remaining workouts
          ...workouts.skip(1).map((w) => WorkoutCard(workout: w)).toList(),
        ]
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Start Next Workout', style: AppTheme.text.titleBar,),
        backgroundColor: AppTheme.colors.primary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => WorkoutScreen(workout: workouts.first)
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}