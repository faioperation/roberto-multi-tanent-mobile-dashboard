import 'package:flutter/material.dart';
import '../features/Auth/screen/login_screen.dart';
import 'app_theme.dart';
import 'theme_controller.dart';


class Roberto extends StatelessWidget {
  const Roberto ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) {
        return MaterialApp(
          title: "Tugatai Cargo's",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          home: const LoginScreen(),
        );
      },
    );
  }
}