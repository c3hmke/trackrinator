import 'package:flutter/material.dart';
import 'package:trackrinator/app/theme.dart';
import 'package:trackrinator/models/exercise.dart';

class ExerciseRow extends StatelessWidget {
  final Exercise exercise;

  const ExerciseRow({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(exercise.name, style: AppTheme.text.header),
        Text('${exercise.weight} kg', style: AppTheme.text.body)
      ],
    );
  }


}