import 'package:flutter/material.dart';
import 'package:trackrinator/widgets/exercise_row.dart';
import 'package:trackrinator/widgets/header.dart';
import 'package:trackrinator/widgets/exercise_row.dart';
import 'package:trackrinator/models/workout.dart';

class WorkoutScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutScreen({Key? key, required this.workout}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const Header(title: '🏋 5x5 Trackrinator 🏋'),

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: workout.exercises.length + 1,
        itemBuilder: (context, index) {

          // Workout Title Row
          if (index == 0) {
            return Column(
              children: [
                Center(
                    child: Text(
                        workout.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                    )
                ),
                const SizedBox(height: 16)
              ]
            );
          }

          // Exercise Rows
          return ExerciseRow(exercise: workout.exercises[index - 1]);
        },
      ),

    );
  }
}