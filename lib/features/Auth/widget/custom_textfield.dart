import 'package:flutter/material.dart';

import '../../../app/app_color.dart';

class CustomTextfield extends StatefulWidget {
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final Color textColor;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const CustomTextfield({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.controller,
    this.textColor = Colors.black,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: widget.textColor,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.primary,),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off
                : Icons.visibility,
            color:  AppColor.primary,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : widget.suffixIcon,
      ),
    );
  }
}
