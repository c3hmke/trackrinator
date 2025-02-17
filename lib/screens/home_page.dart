import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trackrinator/widgets/workout_a.dart';
import 'package:trackrinator/widgets/workout_b.dart';

class HomePage extends StatefulWidget
{
    const HomePage({ super.key });

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
    late String _currentWorkout = 'A';
    late double _weightIncrement = 2.5;

    late double _squatWeight = 0.0;
    late double _benchWeight = 0.0;
    late double _rowWeight = 0.0;
    late double _deadliftWeight = 0.0;
    late double _MilpressWeight = 0.0;

    @override
    void initState() { _loadData(); super.initState(); }
    void _loadData() async 
    {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        setState(()
        {
            _currentWorkout  = prefs.getString('current_workout') ?? 'A';
            _weightIncrement = prefs.getDouble('weight_increment') ?? 2.5;

            _squatWeight     = prefs.getDouble('squat_weight') ?? 0.0;
            _benchWeight     = prefs.getDouble('bench_weight') ?? 0.0;
            _rowWeight       = prefs.getDouble('row_weight') ?? 0.0;
            _deadliftWeight  = prefs.getDouble('deadlift_weight') ?? 0.0;
            _MilpressWeight  = prefs.getDouble('milpress_weight') ?? 0.0;
        });
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Row(
                    children: <Widget>
                    [
                        Expanded(child: Text('Trackrinator',  style: Theme.of(context).textTheme.headlineMedium)),
                        Expanded(child: Text(_currentWorkout, style: Theme.of(context).textTheme.headlineLarge)),
                    ],
                ),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Center(
                child: _currentWorkout == 'A'
                        ? WorkoutA()
                        : WorkoutB()
            ),
            floatingActionButton: FloatingActionButton(
                onPressed:  _completeWorkout,
                tooltip:    'Complete Workout',
                child:      const Icon(Icons.done),
            ),
        );
    }


    Future<void> _completeWorkout() async
    {
        final prefs = await SharedPreferences.getInstance();

        _currentWorkout = _currentWorkout == 'A' ? 'B' : 'A';

        prefs.setString('current_workout', _currentWorkout);

        setState(()
        {
            _currentWorkout = _currentWorkout;
        });
    }
}
