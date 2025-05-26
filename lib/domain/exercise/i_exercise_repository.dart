import 'package:trackrinator/domain/exercise/exercise.dart';
import 'package:trackrinator/domain/common/id.dart';

/// Repository interface for interacting with Exercises
abstract class IExerciseRepository {
  Future<void> addExercise(Exercise exercise);
  Future<void> updateExercise(Exercise exercise);
  Future<void> deleteExercise(Id id);
  Future<Exercise?> getExerciseById(Id id);
  Future<List<Exercise>> getAllExercises();
}
