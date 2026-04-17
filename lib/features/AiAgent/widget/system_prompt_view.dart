import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Auth/widget/custom_textfield.dart';

class SystemPromptView extends StatelessWidget {
  const SystemPromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Texts
          const Text(
            'System Prompt',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Define how your AI agent should behave and respond to customers',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),

          // Content Box Title
          const Text(
            'System Instructions',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 8),

          // TextField
          const CustomTextfield(
            hintText: 'Enter system prompt...',
          ),
          const SizedBox(height: 8),

          // Caption below textfield
          const Text(
            "This prompt defines the AI's personality, knowledge, and behavior",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 24),

          // Save button (left aligned)
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined, size: 18),
            label: const Text(
              'Save Prompt',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary, // Match the red color
              foregroundColor: AppColor.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
