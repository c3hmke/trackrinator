import 'package:flutter/material.dart';
import 'package:trackrinator/app/theme.dart';
import 'package:trackrinator/models/exercise.dart';
import 'package:trackrinator/components/pill.dart';

class ExerciseRow extends StatefulWidget {
  final Exercise exercise;

  const ExerciseRow({Key? key, required this.exercise}) : super(key: key);

  @override
  State<ExerciseRow> createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<ExerciseRow> {
  // Checkboxes for tracking progress
  final List<bool> _checked = List.generate(5, (_) => false);

  // Format weight displays in app
  String formattedWeight(double w) => '${w.toStringAsFixed(1)}';

  @override
  Widget build(BuildContext context) {
    // Calculate the warmup weights
    final warmupWeights = [
      widget.exercise.weight * 0.4,
      widget.exercise.weight * 0.5,
      widget.exercise.weight * 0.6
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Exercise Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Text(widget.exercise.name, style: AppTheme.text.header),
           Pill(
               text: Text(formattedWeight(widget.exercise.weight), style: AppTheme.text.titleBar),
               color: AppTheme.colors.primary),
          ],
        ),
        const SizedBox(height: 8),

        // Warmups Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Warmup weights:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: warmupWeights
                  .map((w) => Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Pill(
                      text: Text(formattedWeight(w), style: const TextStyle(color: Colors.white)),
                      color: AppTheme.colors.secondary,
                    )
                  ))
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Tracking Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: _checked[index],
                onChanged: (val) { setState(() => _checked[index] = val ?? false); },
                activeColor: AppTheme.colors.accent,
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            );
          }),
        ),
        const SizedBox(height: 12),

      ]
    );
  }
}