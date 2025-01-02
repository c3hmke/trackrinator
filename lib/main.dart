import 'package:flutter/material.dart';
import 'package:trackrinator/src/app.dart';
import 'package:trackrinator/src/settings/settings_controller.dart';
import 'package:trackrinator/src/settings/settings_service.dart';

void main() async
{
    // Build the application controllers
    final settingsController = SettingsController(SettingsService());

    // Load in any needed services before running the app
    await settingsController.loadSettings();

    runApp(App(
        settingsController: settingsController
    ));
}


