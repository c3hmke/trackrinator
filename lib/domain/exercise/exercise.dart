import 'package:trackrinator/domain/common/id.dart';

/// Represents the core Exercise entity of the application.
///
/// This entity is the main glue of the application and is
/// used to build and log workouts.
class Exercise {
  final Id id;
  final String name;
  final int sets;
  final int reps;

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
  });
}
