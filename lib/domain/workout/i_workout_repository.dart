import 'workout.dart';

abstract class IWorkoutRepository {
  Future<void> addWorkout(Workout workout);
}