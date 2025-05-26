import 'package:trackrinator/domain/exercise/exercise.dart';
import 'package:trackrinator/domain/exercise/i_exercise_repository.dart';
import 'package:trackrinator/domain/common/id.dart';

/// Repository for managing data for Exercises
class ExerciseRepository implements IExerciseRepository {
  // TESTING: In-memory store (replace with DB later)
  final Map<String, Exercise> _store = {};

  @override
  Future<void> addExercise(Exercise exercise) async =>
      _store[exercise.id.value] = exercise;

  @override
  Future<void> updateExercise(Exercise exercise) async =>
      _store[exercise.id.value] = exercise;

  @override
  Future<void> deleteExercise(Id id) async =>
      _store.remove(id.value);

  @override
  Future<Exercise?> getExerciseById(Id id) async =>
      _store[id.value];

  @override
  Future<List<Exercise>> getAllExercises() async =>
      _store.values.toList();
}