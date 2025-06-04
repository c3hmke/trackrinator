import 'package:trackrinator/domain/exercise/exercise.dart';

/// Repository interface for interacting with Exercises
abstract class IExerciseRepository {
  Future<void> addExercise(Exercise exercise);
  Future<void> updateExercise(Exercise exercise);
  Future<void> deleteExercise(String id);
  Future<Exercise?> getExerciseById(String id);
  Future<List<Exercise>> getAllExercises();
}
