import 'package:flutter/material.dart';
import 'package:trackrinator/app/theme.dart';
import 'package:trackrinator/models/exercise.dart';
import 'package:trackrinator/components/pill.dart';

class ExerciseRow extends StatelessWidget {
  final Exercise exercise;

  const ExerciseRow({Key? key, required this.exercise}) : super(key: key);

  String formattedWeight(double w) => '${w.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {

    // Calculate the warmup weights
    final warmupWeights = [
      exercise.weight * 0.4,
      exercise.weight * 0.5,
      exercise.weight * 0.6
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Exercise Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Text(exercise.name, style: AppTheme.text.header),
           Pill(
               text: Text(formattedWeight(exercise.weight), style: AppTheme.text.titleBar),
               color: AppTheme.colors.primary),
          ],
        ),
        const SizedBox(height: 8),

        // Warmups Row
        const Text('Warmup set weights'),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: warmupWeights
              .map((w) => Pill(
                text: Text(formattedWeight(w), style: const TextStyle(color: Colors.white)),
                color: AppTheme.colors.secondary,
              ))
              .toList(),
        ),
      ]
    );
  }
}