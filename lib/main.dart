import 'package:flutter/material.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:trackrinator/domain/exercise/exercise.dart';

import 'domain/common/id.dart' show Id;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackrinator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ExerciseListScreen(),
    );
  }
}

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({super.key});

  // Hardcoded list
  List<Exercise> get _exercises => [
    Exercise.create(
      name: 'Push Ups',
      sets: 3,
      reps: 15,
    ),
    Exercise.create(
      name: 'Squats',
      sets: 4,
      reps: 20,
    ),
    Exercise.create(
      name: 'Plank',
      sets: 3,
      reps: 60, // seconds
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercises')),
      body: ListView.builder(
        itemCount: _exercises.length,
        itemBuilder: (context, index) {
          final exercise = _exercises[index];
          return ListTile(
            title: Text('${exercise.id}: ${exercise.name}'),
            subtitle: Text('${exercise.sets} sets x ${exercise.reps} reps'),
          );
        },
      ),
    );
  }
}
