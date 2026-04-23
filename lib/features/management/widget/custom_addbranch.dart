import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Auth/widget/custom_textfield.dart';

class CustomAddbranch extends StatelessWidget {
  const CustomAddbranch({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width > 900;
    final bool isMobile = width < 600;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColor.white,
      child: Container(
        width: isDesktop ? 500 : width * 0.9,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context, isMobile),
              const SizedBox(height: 24),

              // Form Fields
              _buildFieldLabel("User Name"),
              const CustomTextfield(hintText: "John smith"),
              const SizedBox(height: 16),

              _buildFieldLabel("User Mail"),
              const CustomTextfield(hintText: "john12@gmail.com"),
              const SizedBox(height: 16),

              _buildFieldLabel("Address"),
              const CustomTextfield(hintText: "New York, NY"),
              const SizedBox(height: 16),

              _buildFieldLabel("Status"),
              const CustomTextfield(hintText: "Active"),
              const SizedBox(height: 24),

              // Actions
              _buildActions(context, isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Branch",
                style: TextStyle(
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff111827),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Add a new business location",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: Color(0xff6B7280), size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff374151),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context, bool isMobile) {
    final cancelBtn = OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onPressed: () => Navigator.pop(context),
      child: const Center(
        child: Text(
          "Cancel",
          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.w600),
        ),
      ),
    );

    final createBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      onPressed: () => Navigator.pop(context),
      child: const Center(
        child: Text(
          "Create Branch",
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w600),
        ),
      ),
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          createBtn,
          const SizedBox(height: 12),
          cancelBtn,
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: cancelBtn),
        const SizedBox(width: 12),
        Expanded(child: createBtn),
      ],
    );
  }
}