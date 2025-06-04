import 'workout.dart';

abstract class IWorkoutRepository {
  Future<void> addWorkout(Workout workout);
  Future<List<Workout>> getAllWorkouts();
  Future<void> removeWorkout(String id);
}