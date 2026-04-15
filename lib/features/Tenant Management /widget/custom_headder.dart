import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class CustomHeadder extends StatelessWidget {
  final String label;
  const CustomHeadder({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColor.black,
      ),
    );
  }
}

