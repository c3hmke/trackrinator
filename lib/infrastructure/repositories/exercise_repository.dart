import 'package:sqflite/sqflite.dart';
import 'package:trackrinator/domain/exercise/exercise.dart';
import 'package:trackrinator/domain/exercise/i_exercise_repository.dart';
import 'package:trackrinator/infrastructure/app_db.dart';

/// Repository for managing data for Exercises
class ExerciseRepository implements IExerciseRepository {
  // TESTING: In-memory store (replace with DB later)
  //final Map<String, Exercise> _store = {};
  @override
  Future<void> addExercise(Exercise exercise) async {
    final db = await AppDatabase.instance;

    await db.insert(
      'exercises',
      {
        'id': exercise.id,
        'name': exercise.name,
        'sets': exercise.sets,
        'reps': exercise.reps,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateExercise(Exercise exercise) async {
    final db = await AppDatabase.instance;
    
    await db.update(
      'exercises',
      {
        'name': exercise.name,
        'sets': exercise.sets,
        'reps': exercise.reps,
      },
      where: 'id = ?',
      whereArgs: [exercise.id]
    );
  }

  @override
  Future<void> deleteExercise(String id) async {
    final db = await AppDatabase.instance;
    await db.delete('exercises', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    final db = await AppDatabase.instance;
    final rows = await db.query('exercises', where: 'id = ?', whereArgs: [id]);

    if (rows.isEmpty) return null;

    return Exercise.fromPrimitives(
      id: rows.first['id'] as String,
      name: rows.first['name'] as String,
      sets: rows.first['sets'] as int,
      reps: rows.first['reps'] as int,
    );
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    final db = await AppDatabase.instance;
    final rows = await db.query('exercises');

    return rows.map((row) => Exercise.fromPrimitives(
        id: row['id'] as String,
        name: row['name'] as String,
        sets: row['sets'] as int,
        reps: row['reps'] as int,
      )
    ).toList();
  }
}