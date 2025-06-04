import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Database? _db;

  static Future<Database> get instance async =>
      (_db != null) ? _db! : await _init();

  static Future<Database> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'trackrinator.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE exercises (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            sets INTEGER NOT NULL,
            reps INTEGER NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE workouts (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE workout_exercises (
            workout_id TEXT NOT NULL,
            exercise_id TEXT NOT NULL,
            PRIMARY_KEY(workout_id, exercise_id),
            FOREIGN_KEY(workout_id) REFERENCES workouts(id) ON DELETE CASCADE,
            FOREIGN_KEY(exercise_id) REFERENCES exercises(id) ON DELETE CASCADE,
        ''');
      }
    );

    return _db!;
  }
}