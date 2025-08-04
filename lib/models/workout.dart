import 'package:trackrinator/models/exercise.dart';

class Workout {
  final String title;
  final DateTime lastCompletedAt;
  final List<Exercise> exercises;

  Workout({
   required this.title,
   required this.lastCompletedAt,
   required this.exercises,
  });
}