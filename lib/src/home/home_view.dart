import 'package:flutter/material.dart';
import '../settings/settings_view.dart';

class HomeView extends StatelessWidget
{
    const HomeView({ super.key });

    static const routeName = '/';

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            
            appBar: AppBar(
                title: const Text('Trackrinator'),
                actions: [
                    IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.restorablePushNamed(context, SettingsView.routeName))
                ],
            ),

            body: Center( child: Text('Hello World!') ),

        );
    }
}