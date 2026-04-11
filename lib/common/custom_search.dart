import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;

  const CustomSearch({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: (_) => onSubmitted?.call(),

          textAlignVertical: TextAlignVertical.center,

          decoration: const InputDecoration(
            isDense: true,

            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),

            hintText: "Search...",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),

            border: InputBorder.none,

            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 0,
            ),
          ),
        ),
      ),
    );
  }
}