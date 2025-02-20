import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget
{
    const App({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp
        (
            title: 'Trackrinator',
            theme: ThemeData
            (
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
            ),
            home: const HomePage(),
        );
    }
}