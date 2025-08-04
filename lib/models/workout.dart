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

class Exercise {
  final String name;
  final double weight;

  Exercise({
   required this.name,
   required this.weight,
  });
}