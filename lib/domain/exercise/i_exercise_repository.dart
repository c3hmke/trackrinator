/// Repository interface for interacting with Exercises
abstract class IExerciseRepository {
  Future<void> addExercise(Exercise exercise);
  Future<void> updateExercise(Exercise exercise);
  Future<void> deleteExercise(UniqueId id);
  Future<Exercise?> getExerciseById(UniqueId id);
  Future<List<Exercise>> getAllExercises();
}