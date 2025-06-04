import 'package:trackrinator/services/nano_id.dart';

/// Represents the core Exercise entity of the application.
///
/// This entity is the main glue of the application and is
/// used to build and log workouts.
class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;

  // Private constructor to enforce using the factory
  Exercise._({ required this.id, required this.name, required this.sets, required this.reps });

  // Factory methods
  factory Exercise.create({required String name, required int sets, required int reps,}) {
    return Exercise._(
        id: NanoId.generate(),
        name: name,
        sets: sets,
        reps: reps
    );
  }
  factory Exercise.fromPrimitives({required String id, required String name, required int sets, required int reps}) {
    return Exercise._(id: id, name: name, sets: sets, reps: reps);
  }
}
