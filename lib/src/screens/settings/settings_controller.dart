import 'package:flutter/material.dart';
import 'settings_service.dart';

class SettingsController with ChangeNotifier
{
    SettingsController(this._settingsService);

    final SettingsService _settingsService;
    late ThemeMode _themeMode;
  
    // make _themeMode publically viewable
    ThemeMode get themeMode => _themeMode;

    Future<void> loadSettings() async
    {
        _themeMode = await _settingsService.loadThemeMode();
        notifyListeners();
    }



    Future<void> updateThemeMode(ThemeMode? themeMode) async
    {
        // When no/bad changes are made we simply bail.
        if (themeMode == null || themeMode == _themeMode) return;

        // Set the updates in memory then persist them.
        _themeMode = themeMode;
        await _settingsService.updateThemeMode(themeMode);
        
        // Notify any listeners of the change
        notifyListeners();
    }
}
