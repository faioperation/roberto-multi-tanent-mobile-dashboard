import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final initialThemeMode = await ThemeController.getStoredThemeMode();
  themeController = ThemeController(initialMode: initialThemeMode);
  
  runApp(const Roberto());
}
