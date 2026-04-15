import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;

  const CustomProfile({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),

        TextField(
          cursorColor: Colors.red, // focus cursor color

          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, size: 18) : null,
            hintText: hint,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),

            filled: true,
            fillColor: Colors.white,

            // normal border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),

            // enabled border (grey)
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),

            // focused border (red)
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}