import 'package:flutter/material.dart';
import 'package:trackrinator/app/theme.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String lastCompletedDate;
  final List<Map<String, dynamic>> exercises;

  const WorkoutCard({
    required this.title,
    required this.lastCompletedDate,
    required this.exercises,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title & Date Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTheme.text.header),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppTheme.colors.primary,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                      lastCompletedDate,
                      style: const TextStyle(color: Colors.white, fontSize: 14)
                  )
                )
              ],
            ),

            const SizedBox(height: 12),

            // Exercise Rows
            ...exercises.map((e) =>
                Padding(padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e['name']!, style: AppTheme.text.body),
                      Text('${e['weight']!} kg', style: AppTheme.text.body)
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
