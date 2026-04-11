import 'package:flutter/material.dart';
import '../features/Auth/screen/login_screen.dart';


class Roberto extends StatelessWidget {
  const Roberto ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Roberto",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}