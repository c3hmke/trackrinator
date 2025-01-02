import 'package:flutter/material.dart';
import 'home/home_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class App extends StatelessWidget
{
    const App({ super.key, required this.settingsController });

    final SettingsController settingsController;

    @override
    Widget build(BuildContext context)
    {
        return ListenableBuilder(
            listenable: settingsController,
            builder:    (BuildContext, Widget? child)
            {
                return MaterialApp(
                    restorationScopeId: 'app',
                    theme:              ThemeData(),
                    themeMode:          settingsController.themeMode,
                    onGenerateTitle:    (context) => 'trackrinator',
                    onGenerateRoute:    (settings) => MaterialPageRoute<void>(

                        settings: settings,
                        builder:  (context) => switch(settings.name)
                        {
                            SettingsView.routeName => SettingsView(controller: settingsController),
                            _                      => HomeView()
                        },

                    ),
                );
            }
        );
    }
}