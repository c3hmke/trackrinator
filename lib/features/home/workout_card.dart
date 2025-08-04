import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackrinator/app/theme.dart';
import 'package:trackrinator/models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({ required this.workout, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title & Date Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(workout.title, style: AppTheme.text.header),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppTheme.colors.primary,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                      DateFormat('MMM dd').format(workout.lastCompletedAt),
                      style: const TextStyle(color: Colors.white, fontSize: 14)
                  )
                )
              ],
            ),

            const SizedBox(height: 12),

            // Exercise Rows
            ...workout.exercises.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name, style: AppTheme.text.body),
                    Text('${e.weight.toStringAsFixed(2)} kg', style: AppTheme.text.body)
                  ],
                )
              )
            ),

          ],
        ),
      ),
    );
  }
}
