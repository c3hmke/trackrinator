import 'package:sqflite/sqflite.dart';
import 'package:trackrinator/domain/workout/workout.dart';
import 'package:trackrinator/domain/workout/i_workout_repository.dart';
import 'package:trackrinator/infrastructure/app_db.dart';

class WorkoutRepository implements IWorkoutRepository {
  @override
  Future<void> addWorkout(Workout workout) async {
    final db = await AppDatabase.instance;
    await db.insert('workouts', workout.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}