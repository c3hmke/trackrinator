import 'package:flutter/material.dart';

/// Store and retrieve the user settings
class SettingsService
{
    /// Loads the User's preferred ThemeMode from local or remote storage.
    Future<ThemeMode> loadThemeMode() async => ThemeMode.system;
    Future<void>      updateThemeMode(ThemeMode theme) async {}
}
