import 'package:your_project/domain/exercise/models/exercise.dart';
import 'package:your_project/domain/common/common/id.dart';
import 'package:your_project/domain/exercise/repositories/exercise_repository.dart';

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
    return _store[id.value];

  @override
  Future<List<Exercise>> getAllExercises() async =>
    return _store.values.toList();
}