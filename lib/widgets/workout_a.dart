import 'package:flutter/material.dart';

class WorkoutA extends StatelessWidget
{
  const WorkoutA({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                    Text('squat: $_squatWeight'),
                ],
            ),
        );
    }
}