import 'package:trackrinator/domain/exercise/exercise.dart';
import 'package:trackrinator/services/nano_id.dart';

class Workout {
  final String id;
  final String name;
  final List<Exercise> exercises;

  Workout._({ required this.id, required this.name, required this.exercises });

  ///   FACTORY METHODS   ///
  factory Workout.create({
    required String name,
    List<Exercise>? exercises,
  }) {
    return Workout._(
      id: NanoId.generate(),
      name: name,
      exercises: exercises ?? []
    );
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout._(
      id: map['id'] as String,
      name: map['name'] as String,
      exercises: (map['exercises'] as List<dynamic>? ?? [])
          .map((e) => Exercise.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  factory Workout.fromPrimitives({required String id, required String name, required List<Exercise>? exercises}) {
    return Workout._(
      id: id,
      name: name,
      exercises: exercises ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'exercises': exercises.map((e) => e.toMap()).toList(),
    };
  }

  ///   DOMAIN METHODS   ///
  void addExercise(Exercise exercise) => exercises.add(exercise);
  void removeExercise(String id) => exercises.removeWhere((e) => e.id == id);
}