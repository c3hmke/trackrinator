import 'package:flutter/material.dart';
import 'package:trackrinator/widgets/exercise_row.dart';
import 'package:trackrinator/components/header.dart';
import 'package:trackrinator/models/workout.dart';

class WorkoutScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutScreen({Key? key, required this.workout}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const Header(title: '🏋 5x5 Trackrinator 🏋'),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title Row
            Center(child: Text(
              workout.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 16),

            // The Exercises
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                itemCount: workout.exercises.length,
                itemBuilder: (context, index) =>
                    ExerciseRow(exercise: workout.exercises[index]),
              ),
            )
          ],
        ),
      )

    );
  }
}