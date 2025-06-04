import 'package:trackrinator/domain/workout/workout.dart';
import 'package:trackrinator/domain/workout/i_workout_repository.dart';

class WorkoutRepository implements IWorkoutRepository {
  @override
  Future<void> addWorkout(Workout workout) {
    // TODO: implement addWorkout
    throw UnimplementedError();
  }

  @override
  Future<List<Workout>> getAllWorkouts() {
    // TODO: implement getAllWorkouts
    throw UnimplementedError();
  }

  @override
  Future<void> removeWorkout(String id) {
    // TODO: implement removeWorkout
    throw UnimplementedError();
  }
  
}