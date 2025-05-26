import 'package:flutter/material.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:trackrinator/domain/exercise/exercise.dart';
import 'package:trackrinator/infrastructure/repositories/exercise_repository.dart';

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

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  final _repository = ExerciseRepository();
  List<Exercise> _exercises = [];

  @override
  void initState() {
    super.initState();
    _seedAndLoad();
  }

  Future<void> _seedAndLoad() async {
    await _repository.addExercise(Exercise.create(name: "Push Ups", sets: 3, reps: 15));
    await _repository.addExercise(Exercise.create(name: "Squats", sets: 4, reps: 20));
    await _repository.addExercise(Exercise.create(name: "Plank", sets: 3, reps: 60));

    final all = await _repository.getAllExercises();
    setState(() => _exercises = all);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercises')),
      body: ListView.builder(
        itemCount: _exercises.length,
        itemBuilder: (context, index) {
          final exercise = _exercises[index];
          return ListTile(
            title: Text(exercise.name),
            subtitle: Text('${exercise.sets} sets x ${exercise.reps} reps'),
            trailing: SizedBox(
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${exercise.id}', style: const TextStyle(fontSize: 12)),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await _repository.deleteExercise(exercise.id);
                      final all = await _repository.getAllExercises();
                      setState(() => _exercises = all);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExerciseModal,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openAddExerciseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 24,
        ),
        child: AddExerciseForm(onSubmit: (name, sets, reps) async {
          final newExercise = Exercise.create(name: name, sets: sets, reps: reps);
          await _repository.addExercise(newExercise);
          final all = await _repository.getAllExercises();
          setState(() => _exercises = all);
          Navigator.of(context).pop();
        }),
      ),
    );
  }
}

class AddExerciseForm extends StatefulWidget {
  final Future<void> Function(String name, int sets, int reps) onSubmit;

  const AddExerciseForm({super.key, required this.onSubmit});

  @override
  State<AddExerciseForm> createState() => _AddExerciseFormState();
}

class _AddExerciseFormState extends State<AddExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final sets = int.parse(_setsController.text);
      final reps = int.parse(_repsController.text);
      widget.onSubmit(name, sets, reps);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Exercise Name'),
            validator: (value) => value == null || value.isEmpty ? 'Required' : null,
          ),
          TextFormField(
            controller: _setsController,
            decoration: const InputDecoration(labelText: 'Sets'),
            keyboardType: TextInputType.number,
            validator: (value) =>
            value == null || int.tryParse(value) == null ? 'Enter a valid number' : null,
          ),
          TextFormField(
            controller: _repsController,
            decoration: const InputDecoration(labelText: 'Reps'),
            keyboardType: TextInputType.number,
            validator: (value) =>
            value == null || int.tryParse(value) == null ? 'Enter a valid number' : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _submit, child: const Text('Add Exercise')),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}




